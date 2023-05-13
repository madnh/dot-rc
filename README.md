# .RC

Shell utils to manage and load custom RC files

## Install

### Step 1: Create folder to put your config files

You can use any folder name and path as you want, in this example i use `$HOME/.rc/` folder

```sh
mkdir .rc
```

### Step 2: Download `rc.sh` script

Download [rc.sh](./rc.sh) file to somewhere, you can put it inside your RC folder too, example:

- `$HOME/.oh-rc.sh`
- `$HOME/.rc.sh`
- `$HOME/.rc/init.sh`

In this example i will put it inside `$HOME/.rc/` folder to ease management.

```sh
wget https://raw.githubusercontent.com/madnh/dot-rc/master/rc.sh -O $HOME/.rc/init.sh
```

## Usage

### Step 1: Put config to `$RC_HOME` folder

You free to structure your RC folder, below is example:

```sh
cd .rc
vim base.sh
vim _env.sh
vim _alias.sh
vim _path.sh

mkdir modules
vim modules/zsh.zsh
vim modules/gcloud-sdk.sh
vim modules/starship.sh
#....
```

Inside of `$RC_HOME` folder, you can load other files by use `rc-load` command, example:

```sh
# ~/.rc/base.sh

rc-load "_envs.sh"
rc-load "_alias"                    # <---- just filename is ok
rc-load "_paths.sh"

# Load modules
rc-load modules/zsh
# rc-load modules/gcloud-sdk.sh     # <---- Disable modules to load
rc-load modules/starship.sh
```

### Step 2:
Edit your shell's rc file to source downloaded `.rc.sh` file. Example: `.zshrc`, `.bashrc`,...

```sh
# $HOME/.zshrc

# Load init script
source $HOME/.rc/init.sh

# Load RC files
rc-load "base"     # <---- $HOME./rc/base.sh
```


### Example

```
.
├── init.sh                   #  <--- init file
├── _alias.sh
├── _envs.sh
├── _paths.sh
├── base.sh                   #  <--- Base profile
├── linux.sh                  #  <--- Profile for Linux
├── macos.sh                  #  <--- Profile for MacOS
├── config
│   └── starship.toml
└── modules
    ├── ansible.sh
    ├── autocomplete.sh
    ├── autojump.zsh
    ├── direnv.zsh
    ├── funcs.sh
    ├── gcloud-sdk.sh
    ├── go.sh
    ├── init.sh
    ├── iterm2_shell_integration.zsh
    ├── prezto.zsh
    ├── rust.sh
    ├── starship.sh
    └── zsh.zsh
```
