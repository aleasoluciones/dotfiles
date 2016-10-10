# Bifer dotfiles

## Installation
**WARNING:** This will overwrite your vim local configuration (~/.vimrc and ~/.vim/) so backup them first.

Clone this repository and run the `setup.sh` script.

## Update

Go to your local copy of the repository and run:

```
git pull
./setup.sh
```

## Testing environment
We use vagrant (ubuntu 15.04) to test this configuration:

```
vagrant up
vagrant ssh
/vagrant/setup.sh
```

##Git hooks
`cp ./git_hooks/* <your_repo>/.git/hooks/`