# Installation Instructions (please complete before Monday)

To get started you need to install Git, some command line tools, Atom (a text editor) and Matlab. Follow the instructions below.

## Coding Tools

We'll be using git from the command line and through the Atom text editor.

### Git and command line tools

MacOS:
1. Open terminal
1. `xcode-select --install`

Windows 10:
1. Turn Windows features on and off -> check "Windows subsystem for Linux" -> ok
1. Reboot
1. Microsoft Store -> search “Ubuntu” -> Install
1. Set up Ubuntu
    1. Open Ubuntu
    1. Let it install, then set a username and password (you probably want to write this down somewhere)
    1. `sudo apt update`
    1. `sudo apt upgrade`
    1. Note that windows cannot see your root directory. If you want to get to your C drive `cd /mnt/c`. Remember this for later

Ubuntu: All the tools we need are part of a vanilla install

Other operating systems: You're on your own. We will be using Git from the command line.

You should now be able to enter `git --version` and have it return something like "git version 2.17.1". The version won't matter for what we're doing today.

### GitHub

Make a [GitHub account](https://github.com/join) if you don't already have one.

### Atom

Download and installation instructions here: https://atom.io/

## Matlab

UCI provides Matlab to students for free. To download and install it, follow the instructions here: http://laptops.eng.uci.edu/software-installation/matlab

Install Matlab 2019a. You won't need any toolboxes.

# Day 1 / Monday

## Morning: Science, project management and Git

We'll discuss how to manage a project as a graduate student. We'll learn how to use git to do so for a coding project.

The lecture on git and project instructions are in [git-lecture.md](git_lecture/git-lecture.md). We'll write a caption for  [this figure](figure_caption_exercise/figure2.md).

## Afternoon: A sample project and Matlab basics

Now that we know some git basics, we'll set up an example project. Lecture on rationale and map can be found in [project-set-up.md](project-set-up.md).

We'll write the code for this project in Matlab, so we'll learn some Matlab along the way. See [CodingBasics.mlx](CodingBasics.mlx)

Finally, the project itself is in [julia_fractal](julia_fractal).
