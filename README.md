# GITMAN
gitman is a command-line tool that simplifies the process of creating git commits by providing a menu of pre-defined commit messages. Written in Bash, it's easy to use and customize to fit your specific needs.

gitman is particularly helpful in maintaining a standard commit message format across your project, which is critical for clarity and project maintainability. It's perfect for individual developers and teams alike.

## Features
- Interactive commit menu: Provides an easy-to-navigate menu of pre-defined commit messages to choose from.
- Multi-language support: gitman loads different commit messages and categories based on the system language.
- Customizable: You can define your own categories and messages via configuration files.
- Git directory validation: The script validates if your current directory is a git repository and if there are changes to commit.
- Colored display: Using Dracula inspired colors, gitman is easy on the eyes.

## Installation

You can install Gitman either globally (accessible by all users) or locally (accessible only by the current user).
### Global Installation

To install Gitman globally, open your terminal and run:

```
git clone https://github.com/articanne/gitman.git
cd gitman
chmod +x install_global.sh
sudo ./install_global.sh
```
The script will install Gitman in /usr/local/bin and it will be available for all users.

### Local Installation

To install Gitman locally, open your terminal and run:

```
git clone https://github.com/articanne/gitman.git
cd gitman
chmod +x install_local.sh
./install_local.sh
```
The script will install Gitman in ~/.gitman directory and will add it to your PATH.
## Uninstallation

To uninstall Gitman, you can use the provided uninstallation scripts.

### Global Uninstallation

To uninstall Gitman globally, open your terminal and navigate to the Gitman directory, then run:

```
chmod +x uninstall_global.sh
sudo ./uninstall_global.sh
```

### Local Uninstallation

To uninstall Gitman locally, open your terminal and navigate to the Gitman directory, then run:

bash

chmod +x uninstall_local.sh
./uninstall_local.sh

## Usage

Using gitman is as simple as running a bash script. Once you have cloned the repository or downloaded the gitman.sh file, you can use it in your git directory as follows:

```
$ gitman
```

This command will prompt an interactive menu, where you can choose the category and type of commit message, and then enter a detailed message for the commit.

## Customization

gitman is easy to customize. You can define your own commit categories and messages by editing the respective configuration files in the i18 directory. These files are:

- lang_en.cfg: This file contains the general script messages.
- categories_en.cfg: This file contains the commit message categories and their respective options.

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.

Remember, commit often, commit well with gitman!