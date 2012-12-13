dotfiles
========

So many wasted hours to get these just right... almost.

## Usage

1. Install/Configure these known prerequisites

  ```
  brew install mercurial vim tmux reattach-to-user-namespace
  git config --global core.editor /usr/local/bin/vim
  ```

1. Clone this repo (and any other dependant repos)

  ```
  git clone --recursive https://AbleCoder@github.com/AbleCoder/dotfiles.git
  cd dotfiles
  git clone https://github.com/gmarik/vundle.git vim/.vim/bundle/vundle
  ```

1. Create symbolic links

  ```
  mkdir ~/ssh
  ln -s `pwd`/ssh/config ~/.ssh/config
  ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf
  ln -s `pwd`/tmux/.tmux ~/.tmux
  ln -s `pwd`/tmux/battery ~/battery
  ln -s `pwd`/tmux/tmux-pane-maximize ~/tmux-pane-maximize
  ln -s `pwd`/tmux/tvim-toggle-cli-pane ~/tvim-toggle-cli-pane
  ln -s `pwd`/vim/.vimrc ~/.vimrc
  ln -s `pwd`/vim/.vim ~/.vim
  ```

1. Do one time Vim setup

  ```
  vim +BundleInstall +qall
  ```

1. Start working those money makers (your fingers)!!!
