#!/bin/sh

GIT_AUTHOR_NAME="Radu Micu"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"

git config --global user.name "$GIT_AUTHOR_NAME"

GIT_AUTHOR_EMAIL="radu.micu@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

git config --global user.email "$GIT_AUTHOR_EMAIL"
