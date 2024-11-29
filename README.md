# my-dev-env

My local dev env config files

### tmux plugin

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### mason

`:Mason`

### keymaps

-

### Go

-   `go install -v github.com/incu6us/goimports-reviser/v3@latest`
-   `go install mvdan.cc/gofumpt@latest`
-   `go install github.com/segmentio/golines@latest`

-   Also install them using Mason

### Intellij Idea

-   `.ideavimrc` file path: `~/.ideavimrc`
-   Plugins
    -   IdeaVim
    -   IdeaVim-EasyMotion
    -   IdeaVimMuticursor
    -   Which-Key
    -   AceJump

### Nvim link folder
- `ln -s ~/personal/my-dev-env/nvim ~/.config/nvim`

### Uninstall Nvim
- Clean `nvim` folder - link created above
- `rm -rf ~/.local/share/nvim`
