# Make Zsh the default shell environment
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
