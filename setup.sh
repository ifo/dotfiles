# A bash script to install all the things
set -e

# macOS install
macos_setup () {
  # install command line tools
  xcode-select --install # a popup will happen which will install them

  # install homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # turn off homebrew analytics
  brew analytics off

  # install brew cask
  brew install caskroom/cask/brew-cask

  # install homebrew things
  brew install \
    ag \
    bash-completion \
    git \
    go \
    hugo \
    keybase \
    mosh \
    node \
    postgres \
    python \
    python3 \
    reattach-to-user-namespace \
    rethinkdb \
    sqlite \
    tig \
    tmux \
    vim

  # brew cask install things
  brew cask install \
    disk-inventory-x \
    firefox \
    flux \
    google-chrome \
    gpgtools \
    iterm2 \
    mactex \
    vlc

# print reminders for macos setup
echo "
### Add to / Remove from Dock

- Firefox
- iTerm2
- Activity Monitor

### Settings Changes

Trackpad Enable
- Point & Click
	- Tap to click
Accessibility
- Trackpad Options...
  - Enable dragging
    - Three finger drag
Trackpad Disable
- More Gestures
	- Swipe between pages
Finder - display hidden files
- in command line, type: \"defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder\"
- add home directory to sidebar:
Press CMD+SHIFT+H to enter your Home folder in Finder, then press CMD+ArrowUp to get into the Users folder, from there drag the folder of your choice to the Sidebar.

### Specific application modifications

#### Firefox
- Make it default
- Keep in dock
- Preferences
	- General - Show my windows and tabs from last time
	- Search - DuckDuckGo
	- Privacy
		- Firefox will: Use custom settings
		- Accept third-party cookies: Never
	- Security - uncheck Remember passwords for sites
	- Sign in to sync
	- Customize
		- Remove search box

#### iTerm2
- Keep in dock
- Turn off bell (profile specfic)

#### OSX
- Show battery percentage

#### Dock
- Make it slightly smaller
- Autohide

#### Finder
- Show things in columns
- Show hidden items (howto)

#### Spotlight
- turn off bing searches

#### Facetime
- turn off iphone calls
"
}

# Linux
linux_setup () {
  sudo apt-get install \
    mosh \
    neovim \
    tig \
    tmux
}

# Things to install everywhere
general_setup () {
  # ensure the directories exist
  mkdir -p .tmux/plugins
  mkdir -p .config/nvim/nvimbackups
  mkdir -p .config/nvim/nvimswaps

  # set global git configs
  git config --global user.name "Steve McCarthy"
  git config --global user.email "steve@redlua.com"
  git config --global push.default simple
  git config --global core.editor "vim"

  # setup dotfiles
  ln -fns ~/dotfiles/vimrc        .vimrc
  ln -fns ~/dotfiles/bash_profile .bash_profile
  ln -fns ~/dotfiles/tmux.conf    .tmux.conf
  ln -fns ~/dotfiles/init.vim     .config/nvim/init.vim

  # neovim setup
  if [ -f "~/.local/share/nvim/site/autoload/plug.vim" ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  nvim +PlugInstall +qall

  # extra tmux setup
  if [ -d "~/.tmux/tmux-plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  tmux source ~/.tmux.conf
  # TODO figure out how to install tmux plugins in this script

  source ~/.bash_profile
}

# ensure we run this from our home directory
cd

OS=$(uname)
case $OS in
  'Linux')
    linux_setup
    ;;
  'Darwin')
    macos_setup
    ;;
esac

general_setup

echo "we're done!"
