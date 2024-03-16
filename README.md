## Desktop Environment
### Fonts

Put the contents of the `fonts` directory into your `~/.local/share/fonts/` directory.

My plasma font is `Ubuntu Nerd Font Propo Med`
### Theme

Install this [global theme](https://store.kde.org/p/1370871) and also install [Kvantum](https://github.com/tsujan/Kvantum/blob/master/Kvantum/INSTALL.md) to set Dracula as the Kvantum theme.

For the Icons theme, install [Tela Icons Theme](https://store.kde.org/p/1279924/) and select the Dracula variant.

For the Dock Icons, they are custom made for what I use; I've provided some in the `dock_icons` directory.
You can use [this tool](https://svgcolor.com/) to change the color scheme of your icons to the [Dracula color scheme](https://draculatheme.com/contribute) (scroll down for the pallette) for apps that you use.
### Plasma Panel

The layout of my panel is:

[Application Menu]---[Virtual Desktop Bar]---[Event Calendar]---[System Tray]

I have it set to Floating and Opaque in the panel settings.

#### System Tray

To get the Icons that I have in my System Tray, you can paste the contents of the `icons` directory into `~/.local/share/plasma/desktoptheme/Dracula/icons/`, assuming you've installed the Dracula global theme. These icons are most compatible if you set your icon size to `22` in KDE Settings > Appearance > Icons > Configure Icon Sizes > Main Toolbar.

These icons are based on [Utterly Round](https://store.kde.org/p/1901768) icons so show some love to the original creator by upvoting.

If you're using a different theme, replace the word 'Dracula' with the name of your theme in the path, then replace the icons.

My system tray has all icons set to `Always Hidden` except for Audio Volume, Battery and Brightness, Bluetooth, Networks and Media Player, which are set to `Always Shown`.

#### Application Menu

The Application Menu icon is also provided in the `icons` directory.

#### Virtual Desktop Bar

The [Virtual Desktop Bar](https://github.com/wsdfhjxc/virtual-desktop-bar) widget is being used to display virtual desktops.

In the `Appearance` category of the settings, you can change the **Desktop labels** style to `Name`.
Then you can name all of your virtual desktops as either 󰮯 or 󰊠 (left is pacman, right is ghost - icons may not show in your browser).

You can also change the colors as your wish... remember that I have provided the Dracula color pallette in the [Theme](#theme) section.

#### Event Calendar

The [Event Calendar](https://store.kde.org/p/998901/) plugin lets you configure how you want to display the time and date.

If you open up the widget settings and go to the `General` tab... You can enable `Line 1` and put the following string in the textbox to imitate my layout/colors: `'<font color="#8BE9FD">'  ddd  dd  MMM '</font>' '<font color="#8BE9FD">'  |  '</font>' '<font color="#F1FA8C">' h:mm:ss AP  '</font>'` 

I have the changed my font to the `Ubuntu Nerd Font Propo Mono` at size 20px with Bold enabled.

Line 2 is disabled in my configuration.

#### Bismuth and Rounded Corners (Tiling and Borders)

If you would like to use Tiling and Borders, you can use [Bismuth](https://github.com/Bismuth-Forge/bismuth) and [Rounded Corneres](https://github.com/matinlotfali/KDE-Rounded-Corners).

They both integrate quite well with each other and Rounded Corners also allows you to add borders to your active tiles/windows.

## Dolphin

I am using Dolphin as my File Explorer. I believe Kvantum is responsible for setting the theme for Dolphin as described above.

To get the toolbar to show on the left, you can right click and uncheck 'Lock Toolbar Positions' and then drag it to the left of your screen. Don't forget to lock it again.

You can also use some of my dolphin settings by putting `dolphinrc` in `~/.config`.
## Neovim

My Neovim config is provided in the `nvim` directory. You can simply paste that directory into your `~/.config` directory if you want to use my neovim config.

Or you can pick and chose my plugins inside the `nvim/lua/plugin_loader.lua` file.

I use [Neovide](https://github.com/neovide/neovide) as well instead of Neovim in the terminal.

## Discord

For Discord I am using [Vencord](https://vencord.dev/). The theme for vencord is [fawni/dracula](https://github.com/fawni/dracula). They have instructions on how to install it for Vencord.

## Spotify

I am using [Spicetify](https://spicetify.app/docs/advanced-usage/installation/) to style my Spotify.

Once you have Spicetify installed, you can open the 'Marketplace' in your spotify to install the theme 'Text Darkthemer'.

Once it's installed, select the 'Dracula' variant in the dropdown near the search bar.

To get your green accent to turn purple, follow these steps:
1. In Marketplace, go to settings by clicking the gear icon
1. Enable 'Theme developer tools'
1. Go back to the marketplace and you'll notice a paintbrush icon near the theme variant dropdown
1. Click that and replace the section labeled `[Dracula]` with the contents of the `spicetify.ini` file that I have provided.
1. Restart spotify and voila

## Terminal (Wezterm), Zsh and Oh-my-posh

You can install [Wezterm](https://wezfurlong.org/wezterm/installation.html), [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms) and [Oh-my-posh](https://ohmyposh.dev/docs/installation/linux) to make your terminal look like mine.

### Wezterm

Put the `wezterm` directory in your `~/.config` directory to use my wezterm config.

### Zsh

Put the `.zshrc` in your `~` aka `$HOME` directory to use my Zsh config... it's very basic.

### Oh-my-posh

Put the `OhMyPosh` directory in your `~/.configs` directory to use my Oh My Posh config.

## Microsoft Edge (sue me)

For Edge I have the [Plasma Integration](https://microsoftedge.microsoft.com/addons/detail/plasma-integration/dnnckbejblnejeabhcmhklcaljjpdjeh) extension. 
This allows me to go to edge settings and select "KDE" as my theme. It will then use the appropriate theme colors.

Dracula has an official theme for Edge [here](https://draculatheme.com/microsoft-edge). You can follow instruction in there if you want that one.

## Homepage

The dashboard that you see in the browser is called [Homepage](https://gethomepage.dev/latest/).

If you plan to use it, you can use my official Homepage dracula theme [here](https://draculatheme.com/homepage-app).

And that is all folks... I hope you enjoy.
