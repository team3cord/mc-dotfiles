# MattC's dotfiles  

* This is a repo to keep track of my dotfiles.  Each OS is a branch.  Right now I have an OSX and Linux(Ubuntu) specific branch.  As I experiment with more distros I will add more branches.  
  
* Added in shell scripts and list of brew & brew cask packages  
---  

* git clone  target ~/bin/  
* PYTHON $symlinks => will create symlinks for vimrc,bashrc & bash_profile  
* ln -s original target  gitconfig, gitignore_global => **must use full path** 
* git prompt => git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1   
* vim plugin mngr: vim-plug => mkdir ~/.vim/autoload/ => download vim-plug => vim any file run :PlugInstall => reload vim  
* iterm2: config/MC_NORD  

---  

### Packages:  

|Formulae         |
|-----------------|
|bash-completion  |
|bash-git-prompt  |
|python3          |


---  

### ISSUES:  

* vim plugin => neocomplcache is wonky, commented out of vimrc  

* TODO's  
    * add in gulpfile & separate bash/js scripts => concat  
    * include all npm packages set up to global  
    * create bash script to setup new workstation  
    * create bash script to setup new server  
    * clean up vimrc  
    * locate all .rc files for current packages/apps  

---  
 
