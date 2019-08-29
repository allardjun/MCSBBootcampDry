# Managing a project using git

## What is git?

Git is a version control management system for code. It was invented by Linus Torvalds to support development of the Linux kernel. See [this video](https://youtu.be/o8NPllzkFhE?t=433) for more (7:13-9:24). In fact, you can find both [Linux](https://github.com/torvalds/linux) and [git itself](https://github.com/git/git) on GitHub. You can even see [git's first commit](https://github.com/git/git/commit/e83c5163316f89bfbde7d9ab23ca2e25604af290).

## Why git?

For us, keeping track of code with git achieves two objectives:

1. Keep a record
1. Provide a good way for people to work together on development

In bootcamp wet, you kept a record of what you did in a lab notebook. Why?

* Because I told you to
* Reproducibility
* So you remember what you did
* Help you compose write up

All those reasons also apply to code. In fact, we should strive to meet an even higher standard for code than we can for lab work, as results don't depend on anything outside of our control (code may have bugs, but it will at least have the same bug every time).

It is possible (and is now easy) to have perfect reproducibility for results of coding projects. This is not yet the standard for scientific publication, but I think it soon will be (and *should* be the standard we all strive for).

Git makes this easy with the way it keeps a record of the code. In fact it does even better and forces you to document the changes you make. We'll discuss this more later.

Furthermore, along with a host like GitHub, git provides a controlled way for multiple people to work together on a single coding project. Those people can be your lab mates, your PI, or random strangers from the internet.

There are other reasons to use git:

* It is an industry standard. If you get a job working with code, you will likely use git.
* Using git and GitHub to publish code is becoming standard for scientific projects as well. It provides
    * Visibility on a recognized platform
    * Tools for the greater community to interact with you and your code, as well as for them to contribute to it
* It's a good backup

<!---
Furthermore, we are scientists funded by the government to produce work which furthers humanity's understanding of the world around us. The things we produce are not to
-->

## Git basic principles

So git keeps track of different versions of code. How does it do it?

First, we should say:

Git+GitHub is ***NOT*** a code specific version of Dropbox

and then, for good measure, we should also say

**Git+Github is *NOT* a code specific version of Dropbox!!!**

Dropbox and Google Drive both have rudimentary version control, in that they keep a series of copies of a file. Git is both far more powerful than Dropbox, and more fragile (you will be quite unhappy if you try to add a 7GB database to a git repo). So what is it, exactly?

The basic unit of code in git is a repository (**repo**). For example, [here is a repo](https://github.com/JuliaDiffEq/DifferentialEquations.jl) by MCSB alum Chris Rackauckas.

Git keeps track of code in **commits**. A commit is a *list of changes*. It is not the contents of a file. [Here is an example commit](https://github.com/JuliaDiffEq/DifferentialEquations.jl/commit/664c809b3d29a71edef68cb1b05d258910a4518c) from Chris' DifferentialEquations.jl repo. It consists of 9 line deletions and 3 line additions. Along with the list of changes, there is a commit message: a description of what those changes do written by the person who made them.

A repo, then, consists of many sets of changes (commits). You can see the [commit history of Chris' DifferentialEquations.jl repo here](https://github.com/JuliaDiffEq/DifferentialEquations.jl/commits/master).

Why are things organized this way, and what does it allow us to do? First, let's talk about branches.

We can think of the commit history of a repo as a series of dots along a line, representing commits made through time. A **branch** starts at one of these commits and is its own line of dots, running parallel to the first (e.g. master and dev branches below).

![Commits on two branches](Git%20theory%20and%20basics.0012.png "Commits on two branches")

Because commits keep track of changes, two branches can be merged back together, even after they have diverged because multiple people are working on them. An example:

Let's say that at ***a***, the code looks like this:

    Lorem ipsum dolor sit amet
    consectetur adipiscing elit
    sed do eiusmod tempor
    incididunt ut labore

    Ut enim ad minim veniam
    quis nostrud exercitation ullamco
    laboris nisi ut aliquip

On the dev branch, changes are made so at ***b*** the code looks like this:

    Lorem ipsum dolor sit amet
    consectetur adipiscing elit
    sed do eiusmod tempor
    incididunt ut labore
    et dolore magna aliqua.

    Ut enim ad minim veniam quis nostrud exercitation ullamco
    laboris nisi ut aliquip
    ex ea commodo consequat.

Meanwhile, changes have been committed to the master branch so that at ***c***, the code looks like this:

    Lorem ipsum dolor sit amet
    consectetur adipiscing elit
    sed do eiusmod tempor
    incididunt ut labore

    et dolore magna aliqua
    Ut enim ad minim veniam
    laboris nisi ut aliquip

    Duis aute irure dolor
    in reprehenderit in voluptate velit
    esse cillum dolore
    eu fugiat nulla pariatur.

A **merge** is then initiated, where changes from the commits to the dev branch are applied to the code as it exists at ***c***. At ***d***, the merged code would be:

    Lorem ipsum dolor sit amet
    consectetur adipiscing elit
    sed do eiusmod tempor
    incididunt ut labore
    et dolore magna aliqua.

    Ut enim ad minim veniam quis nostrud exercitation ullamco
    laboris nisi ut aliquip
    ex ea commodo consequat.

    Duis aute irure dolor
    in reprehenderit in voluptate velit
    esse cillum dolore
    eu fugiat nulla pariatur.

Note that both sets of changes are kept.

What happens if both branches had changed the same line? Then the merge needs human intervention --- git would prompt you to choose what to keep.

Note that there can be many branches, all working in parallel. They can be merged with each other at any time.

## Benefits of this system

* Linus' dream is fulfilled --- he doesn't have to talk to another human to incorporate their code into his repo
* Each commit is identified by a unique hash. This means if we know the commit hash that was used to generate some result, we know exactly what the code was. No questions of "did I change that before or after doing that plot?"

<!---
20 min
--->

# Using git and GitHub

Now that we know what git is and what it does, how do we use it to manage code for a project? First, let's do an overview of what is where.

## Architecture

A repo can live on your computer, on a remote host (we'll use GitHub, but there are others), or preferably both. If both, changes can be synced back and forth from your computer to the web, and to other computers easily and in a controlled way.

### One coder, multiple computers
Here's a map of how one coder can use GitHub to sync code between computers:
![Map for one coder, multiple computers](Git%20theory%20and%20basics.001.png "One coder, multiple computers")

From your computer, you can ```git pull``` to get commits from GitHub. You can ```git push``` to send commits you've made to GitHub. Therefore you can work on the same repository using multiple computers (say a laptop and a desktop in your lab).

### Multiple coders

Here's a map of how multiple coders can use GitHub to work on code together:
![Map for two coders](Git%20theory%20and%20basics.002.png "Two coders")

For a second coder to join the first, they first fork the repo on GitHub. This forked repo is their own version, which they have total control over. They can work with is as described in the previous section. If the make changes they want to share with coder 1, they go back to GitHub and submit a pull request: a request for coder 1 to pull commits they've pushed up to their repo.


## Dogma

def: "a set of principles laid down by an authority as incontrovertibly true"

* Data does not go in a git repository
    * Note Github has hard filesize limits and git itself will be slow and unhappy with files larger than 20MB or so
* Commits should be atomistic --- they should accomplish one objective (e.g. Take in radius as an input variable). This might involve changes to more than one file.
* Commit messages should be written in the imperative mood (e.g. fix, update, not fixed or updated)
    * More on this and examples can be found [in this write up](https://chris.beams.io/posts/git-commit/)

<!---
10 min
--->

# Group exercise: Caption this figure!

As I'm sure you've noticed, this is a git repository hosted on GitHub. We're going to get started using git with this repo!

## Getting around on the command line

Our objective will be to write a paper together in markdown.

The first thing to do is get the contents of this repository to your computer.

Open the command line and navigate to a place you'd like to keep the code we'll be working on. Here's a quick primer:

### Command line basic navigation

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

Where do we put our repo? First, note that you SHOULD NOT put a git repo in an auto-syncing directory (Dropbox, Google Drive, iCloud, OneDrive). For windows users, go with

`/mnt/c/code`

Mac users should avoid iCloud, Google Drive and Dropbox folders

`/users/username/code`

would be a good place.

### Fork and clone this repo

Go to the [root page](/../../) and use the grey "Fork" button at the top right to get your own version of this repository. On your version, use the green "Clone or download" button to copy the address of your repo.

Now, back in the command line on your computer, type "git clone ", then paste the link (right click on Windows Ubuntu, `⌘`+`v` on MacOS). The command should look like

`git clone https://github.com/yourGitHubusernamehere/MCSBBootcampDry.git`

(but with your github username in place of mbovyn). This command will download the repository from github.com to your computer, putting it into the present working directory.

### Set up your repository

<!---
We should think carefully about the name of the brach for the students to make. I don't think "dev" is right. "mywork"? "projects"? "mybranch"?
-->

Now that we have the repo on your local computer, we want to get your repository set up so that you can use it smoothly.

You'll have two branches:
* "master" branch: Keep this branch clean of your personal work. However, if you have suggestions for changes you think everyone should have (typo fixes, additional links, other improvements) feel free to commit them here, push them up and pull request allardjun/MCSBBootcampDry
* "dev" branch: Add your personal work to this branch

To set up your repository this way, first go into your new folder

`cd MCSBBootcampDry`

Then you can check that everything is working with `git status`. It should return

    birch:MCSBBootcampDry Matt$ git status
    On branch master
    Your branch is up to date with 'origin/master'.

    nothing to commit, working tree clean

This tells you that you are on the master branch and haven't made any changes yet. Now we'll create a new branch called "dev".

`git checkout -b dev`

Then status should return

    birch:MCSBBootcampDry Matt$ git status
    On branch dev
    nothing to commit, working tree clean

#### Create some additions

<!---
Here we learn mkdir, vi basics
--->

Now that you have a place for your work, let's add something to it.

First, make a new folder

`mkdir mywork`

`ls` should reveal it is there. Navigate into it with `cd` and make a new text file

`vi mytextfile.txt`

This will bring you into the vi command line text editor. This is a dangerous place for beginners, as there are no instructions for how to get out! (`esc` doesn't work, if you were thinking that would save you)

When you open the file, you are in *command mode*. There are many possible commands that navigate the document, delete lines, etc. However, since our document is blank, we want to go into *insert mode*. To do so press `i`. The bottom of the screen should say **-- INSERT --**.

In insert mode, you can type, backspace and delete as you probably expect. Type your name.

Now, we want to save the file and exit. To do so, we need to go back to command mode. Press `esc`. **-- INSERT --** should disappear from the bottom of the window. Now type `:wq`. You should see it appear at the bottom of the window. This mean write-quit. Press enter. You should be returned to your command line and `ls` should reveal a new text file in your directory.

At another time you might want to quit without saving. To do so you would use `:q`.

##### Mini exercise: bad file and folder

<!---
Here we learn rm, googling issues, optional arguments to commands
--->

Now that you have the ability to create, you should also gain the ability to destroy.

1. Create a new directory called baddir
1. Navigate into it and create a new file called badfile.txt, with any text you'd like to add to it.

The command to delete things is `rm`. Delete both the file and folder you made.

<!---
Hint: google "rm folder".

Compare results of search for "rm folder" to results of "command line delete folder". Which one is more helpful?

Make sure to demonstrate with tab-complete
--->

#### Commit our addition

Now that we've created something we want to keep, let's commit it.

Go to the root of your repo (`cd ..` if you're in the mywork folder)

`git status` should reveal that you have changes to your repo.

The commit process has two steps: staging and committing.

The command to stage is `git add target`. Target can be a file, folder, or `.`, which means everything.

Stage with `git add .`

`git status` should give you

    dhcp-v021-085:MCSBBootcampDry matthewbovyn$ git status
    On branch dev
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

    	new file:   mywork/mytextfile.txt


Commit with `git commit`

At this stage, you may be asked for credentials. Enter them now.

Recognize this interface? Just like vi! Enter a good commit message (imperative mood!) and save with `:wq`.

Note that commit messages are extremely important. They are not easy to change, so think about what you are writing. Furthermore, other people will see them. Keep that in mind.

Time saving tricks for future use:
* `git commit -a` does an automatic `git add .` (or something like it, doesn't seem to add new files)
* `git commit -m "Commit message here"` lets you skip the text editor if you want a one line commit message
* Can be combined into `git commit -a -m "Commit message`

#### Push up to GitHub

To send your commit up to GitHub, `git push`. It will not work right away. `git push` is the short form. The long form is

`git push origin dev`

Git

You will definitely be asked for credentials at this point (unless you already have them saved).

### Pull down our changes from earlier

Before, we made updates to this markdown file based on the reasons you stated for having a lab manual. As practice, let's get those changes from Matt's computer to all of yours.

Matt does:

1. Examine and commit changes
1. Push to mbovyn/MCSBBootcampDry
1. Pull request allardjun/MCSBBootcampDry
1. Approve pull request

Students do (starting from dev branch):

1. `git status` (if working tree is not clean, git won't let you do anything until you commit or get rid of any changes you've made)
1. `git checkout master`
1. `git pull`
1. `git checkout dev`
1. `git merge master`

## Exercise: Write a figure caption together

### Dogma

* All plots must have axes labels with units
* A figure without a caption is like Ikea furniture without an instruction manual: might be worthwhile if you already know exactly what you're doing, but more likely will just lead to frustration, defeat, and possibly everlasting hatred.

In this section, we'll explore what happens if you don't follow these rules.
