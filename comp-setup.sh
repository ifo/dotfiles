# A bash script to install all the things

cd # go to home directory

# install command line tools
xcode-select --install # a popup will happen which will install them

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew cask
brew install caskroom/cask/brew-cask

# install homebrew things
brew install \
  bash-completion \
  git \
  go \
  python \
  reattach-to-user-namespace \
  rethinkdb \
  ag \
  tig \
  tmux \
  vim

# brew cask install things
brew cask install \
  firefox \
  iterm2 \
  google-chrome

# set global git configs
git config --global user.name "Steve McCarthy"
git config --global user.email "steve@redlua.com"
git config --global push.default simple
git config --global core.editor "vim"

# setup dotfiles
ln -s ~/dotfiles/vimrc        .vimrc
ln -s ~/dotfiles/bash_profile .bash_profile
ln -s ~/dotfiles/tmux.conf    .tmux.conf

# extra vim setup
mkdir .vim
mkdir .vim/vimbackups
mkdir .vim/vimswaps
# get and install vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# extra tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# TODO figure out how to install tmux plugins in this script

# source new .bash_profile
source ~/.bash_profile

# print reminders
echo "
### Add to / Remove from Dock

- Firefox
- iTerm2
- Activity Monitor

### Settings Changes

Trackpad Enable
- Point & Click
	- Tap to click
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
"
