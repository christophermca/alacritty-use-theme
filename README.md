# alacritty-use-theme

Small utility to switch the selected theme used by alacritty terminal.

# Install
1. `pacman -U alacritty-use-theme`
2. Source the script by adding this to your .bashrc
`[[ -f /usr/local/share/alacritty/select-theme.sh ]] && source /usr/local/share/alacritty/select-theme.sh`
3. Add themes to the themes directory `$HOME/.config/alacritty/themes/<theme>`
4. Create an aliases file inside of your alacritty configuration
`touch $HOME/.config/alacritty/alaises.toml`

```toml
# aliases.toml

day = "pencil-light"
# night =  "your-theme-name"  #if unset, Alacritty will use its default theme "tomorrow-night"

```

# Usage
`alacritty-use-theme day`
`alacritty-use-theme night`
