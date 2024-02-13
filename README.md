# Jupyter Chatbook

Works for MacOS and Linux. For Windows please use any Linux Virtual Machine via https://www.virtualbox.org/ or WSL (Windows Subsystem for Linux).

Requires a valid OpenAI and/or MistralAI API key.
## Install
Open a Terminal and run
```bash
git clone https://github.com/zero-overhead/jupyter-chatbook
cd jupyter-chatbook
bin/setup.sh
```
## Uninstall
### MacOS
[Uninstall Homebrew](https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew) and delete the project folders containing the Jupyter notebooks.
### Linux
Open a Terminal and run
```
nix-collect-garbage
```
### Windows
Uninstall Virtual-Box and delete the Virtual Maschine(s), which are just big files.
## Running
### Linux
```bash
cd path/to/jupyter-chatbook
bin/start-jupyter-linux.sh /path/to/project
```
### MacOS
```bash
cd path/to/jupyter-chatbook
bin/start-jupyter-mac.sh /path/to/project
```
### Windows
Spin up your Linux-VM and then do as for Linux.
### Alias

Consider creating an alias. This saves some time ...

If you are using __zsh__
```bash
echo "alias jn=/path/to/jupyter-chatbook/bin/start-jupyter-linux.sh /path/to/work-dir" >> $ZSH_CUSTOM/my_alias.zsh
```

For __bash__ execute
```bash
echo "alias jn=/path/to/jupyter-chatbook/bin/start-jupyter-linux.sh /path/to/work-dir" >> $HOME/.bashrc"
```

Same works for Mac - just change ```start-jupyter-linux.sh```to ```start-jupyter-mac.sh```.

Then just run
```bash
jn
```