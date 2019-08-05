# Day 1 / Monday

## Morning: Science, project management and Git

The goal of this morning is to discuss how to manage a project as a graduate student, focusing on an example of managing a coding project with Git.

To get started you need to install Git itself and some command line tools.

### Coding Tools Installation Instructions

We'll be using git from the command line and through the Atom text editor.

#### Git and command line tools

MacOS:
1. Open terminal
2. `xcode-select --install`

Windows 10:
1. Control Panel -> Turn Windows features on and off -> enable "Windows subsystem for Linux"
2. Reboot
3. Windows Store -> search “Ubuntu” -> Install
4. Set up Ubuntu
  1. Open the command line
  2. `sudo apt update`
  3. `sudo apt install build-essential`
5. Go to a location Windows can see: `cd /mnt/c`

Ubuntu: All the tools we need are part of build-essential. Follow instruction under step 4 above to install it.

Other operating systems: You're on your own. We will be using Git from the command line.

You should now be able to enter `git --version` and have it return something like "git version 2.17.1". The version won't matter for what we're doing today.

#### Atom

Get download here: https://atom.io/

### Clone the bootcamp dry repo and git basics

Now that we have the tools we need installed, let's use them. Our objective will be to write a paper together in markdown.

The first thing to do is get the contents of this repository to your computer.

Open the command line and navigate to a place you'd like to keep the code we'll be working on. Here's a quick primer:

#### Command line basic navigation

`pwd`: prints the current working directory
`ls`: get a list of all the files and folders in the current directory
`cd target`: change to the directory specified by target

Some examples follow. Let's take a folder on my computer as an example. Here's the output of `pwd` and `ls`:

    birch:project_code Matt$ pwd
    /Users/Matt/project_code
    birch:project_code Matt$ ls
    ActinTutorial		bootcamp-test
    Motor-Cargo-Simulator	test folder

Note `pwd` prints the full path, which starts with a "/" indicating the root of the filesystem. Then, from this location, we could do any of
* `cd ActinTutorial`: moves into folder ActinTutorial
* `cd ..`: moves up a folder to /Users/Matt
* `cd ~`: moves to the home directory, for me /Users/Matt
* `cd test\ folder` or `cd "test folder"`: moves to test folder. Note spaces need to be escaped or quotes be used. If you don't, you get:

      birch:project_code Matt$ cd test folder
      -bash: cd: test: No such file or directory

    because spaces separate inputs on the command line

Say we did `cd ..`, moving to /Users/Matt. We could then move several folders at once with `cd project_code/Motor-Cargo-Simulator/simulation_code`, which would take us to the simulation_code folder inside the Motor-Cargo-Simulator folder.

If we then wanted to return to /Users/Matt, we could use `cd ..` three times, `cd ../../..`, or `cd -`, which returns to the last directory.

#### Clone this repo

Go to the [root page](/../../) and use the green "Clone or download" button to copy the address of this repo.

Now, back in the command line on your computer, type "git clone ", then paste the link (right click on Windows Ubuntu, `⌘`+`v` on MacOS). The command should look like

`git clone https://github.com/novqpiousd/bootcamp-test.git`

## Afternoon: A sample project and Matlab basics

### Matlab Install Instructions

UCI provides Matlab to students for free. To download and install it, follow the instructions here: http://laptops.eng.uci.edu/software-installation/matlab
