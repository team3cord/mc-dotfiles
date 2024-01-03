# MattC's dotfiles  

* This is a repo to keep track of my dotfiles.  Each OS is a branch.  Right now I have an OSX and Linux(Ubuntu) specific branch.  As I experiment with more distros I will add more branches.  
  
* Added in shell scripts and list of brew & brew cask packages  
---  

* git clone  target ~/bin/  
* ln -s original target vimrc, bashrc, bash_profile, gitconfig, gitignore_global => **must use full path** 
* git prompt => git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1   
* vim plugin mngr: vim-plug => mkdir ~/.vim/autoload/ => download vim-plug => vim any file run :PlugInstall => reload vim  
* iterm2: config/MC_NORD  

---  

### Homebrew:  

|Formulae         |Casks   |
|-----------------|--------|
|bash-completion  |alfred  |  
|bash-git-prompt  |iterm2  |
|python3          |        |  


---  

* TODO's  
    * add in gulpfile & separate bash/js scripts => concat  
    * include all npm packages set up to global  
    * create bash script to setup new workstation  
    * create bash script to setup new server  
    * clean up vimrc  
    * locate all .rc files for current packages/apps  

---  
