import assert from "node:assert/strict";
import { mkdtemp, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import test from "node:test";

import { InMemoryCredentialStore } from "@earendil-works/pi-ai";
import {
	discoverAndLoadExtensions,
	ExtensionRunner,
	ModelRegistry,
	ModelRuntime,
	SessionManager,
} from "@earendil-works/pi-coding-agent";

const extensionPath = join(dirname(fileURLToPath(import.meta.url)), "..", "continue-after-compaction.ts");

test("automatic compaction steers the continuation into the retried agent turn", async () => {
	const cwd = await mkdtemp(join(tmpdir(), "pi-continue-after-compaction-"));

	try {
		const modelRuntime = await ModelRuntime.create({
			credentials: new InMemoryCredentialStore(),
			modelsPath: null,
			allowModelNetwork: false,
		});
		const loaded = await discoverAndLoadExtensions([extensionPath], cwd, join(cwd, ".agent"));
		assert.deepEqual(loaded.errors, []);

		const sentMessages: Array<{
			readonly content: string;
			readonly deliverAs: "steer" | "followUp" | undefined;
		}> = [];
		loaded.runtime.sendUserMessage = (content, options) => {
			if (typeof content !== "string") {
				throw new Error("Continue after compaction test received unexpected image content");
			}
			sentMessages.push({ content, deliverAs: options?.deliverAs });
		};

		const runner = new ExtensionRunner(
			loaded.extensions,
			loaded.runtime,
			cwd,
			SessionManager.create(cwd),
			new ModelRegistry(modelRuntime),
		);
		runner.bindCore(loaded.runtime, {
			getModel: () => undefined,
			getScopedModels: () => [],
			isIdle: () => false,
			isProjectTrusted: () => true,
			getSignal: () => undefined,
			abort: () => undefined,
			hasPendingMessages: () => false,
			shutdown: () => undefined,
			getContextUsage: () => undefined,
			compact: () => undefined,
			getSystemPrompt: () => "",
		});

		await runner.emit({
			type: "session_compact",
			compactionEntry: {
				type: "compaction",
				id: "compaction-entry",
				parentId: "previous-entry",
				timestamp: new Date().toISOString(),
				summary: "Existing task summary",
				firstKeptEntryId: "first-kept-entry",
				tokensBefore: 100_000,
			},
			fromExtension: false,
			reason: "overflow",
			willRetry: true,
		});
		await new Promise<void>((resolve) => setTimeout(resolve, 0));

		assert.equal(sentMessages.length, 1);
		assert.equal(sentMessages[0]?.deliverAs, "steer");
		assert.match(sentMessages[0]?.content ?? "", /Resume the existing task/);
	} finally {
		await rm(cwd, { recursive: true, force: true });
	}
});
