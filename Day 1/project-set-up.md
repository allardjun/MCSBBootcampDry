

Now that we know how to use git and GitHub, let's talk about organizing your stuff so it works well with git.

A scientific project has, in general, two parts. The first is the part where you do all the work to set up a new method and generate results: grow cells, write code, build instruments, etc. The second is the part where you take what you've done, package it up, and share it with the scientific community. Git can help with both of these.

In this sample project, you'll also do both. Our organization will reflect that.

# The project: Make your own Julia Fractal

The project is to generate an organized git repo for code to create a Julia fractal. You'll write code which generates and writes out some data. In another script, you'll read in that data and plot it. Along the way, you'll have to show that your code passes a test, so we know it works correctly. Finally, you will produce a file including your figures and a caption.

## Your task

For z1, does the mapping z(n+1)=z(n)^2+c, z(1)=z1 go to infinity or
remain finite? If it goes to infinity, we define z1 as in the Julia set (https://en.wikipedia.org/wiki/Julia_set). Plotting the outcome (infinite or non-infinite) for many points, z1, will produce an 'image' of the Julia set. 

Your project is to create a repo for code which generates Julia fractals for different values of c. Your repo will also contain a figure with your results: a figure with 4 Julia fractal images.

Based on this prompt, what are the steps or pieces of code that go into building this?

### Project segments

* A *markdown* file to document all the scripts, functions, test cases, input, and output for the project. 
* A *function* to perform the calculation z(n+1)=z(n)^2+c over and over again. 
* A *script* that generates many points to run followz.m on and record result.
* A *script* which defines the parameters for that particular julia set instance and calls the scripts to generate it.
* A *script* to plot which points are in the Julia set.
* A *script* to test that the code is working correctly.
* A write-up of the project results.

For clarity of discussing organization, we are going to name these pieces as follows:

* A *markdown* file to document all the scripts, functions, test cases, input, and output for the project. 
    * _README.md_
* A *function* to perform the calculation z(n+1)=z(n)^2+c over and over again. 
    * _follow_z.m_
* A *script* that generates many points to run followz.m on and record result.
    * _generate_fractal.m_
* A *script* which defines the parameters for that particular julia set instance and calls the scripts to generate it.
    * _drive_generator.m_
* A *script* to plot which points are in the Julia set.
    * _julia_plot.m_
* A *script* to test that the code is working correctly.
    * _testcase.m_
* A write-up of the project results.
    * _fractal_figure.md_

Don't start yet!

The point of this exercise is to organize the project, not necessarily to complete it.

## Organizing your project

Remember the rule from this morning? ***No data in git.*** Therefore we'll be dividing things up. You should have two different folders inside your repo and one outside, somewhere else on your computer. Here's the scheme:

"codebase" folder (in repo) | "data" folder (not in repo) | "analysis" folder (in repo)
--- | --- | ---
follow_z.m | drive_generator1.m, drive_generator2.m, drive_generator3.m, drive_generator4.m (each with a different value of c)| julia_plot1.m, julia_plot2.m, julia_plot3.m, julia_plot4.m
generate_fractal.m | juliaset1.mat, juliaset2.mat, juliaset3.mat, juliaset4.mat | julia1.png, julia2.png, julia3.png, julia4.png
testcase.m (provided) | &nbsp; | julia_figure.md

### Why like this?

**When coding a large project, you need to test as you go**

follow_z.m is the core of your program. It will be used many times, over and over on different parameter sets. It is a piece we can test in a known case (test like this usually come from knowing how the code should perform in a limited or special case, I've provided the test here).

Often the core of your program needs to be able to output things in different ways. We will do this with follow_z.m.

generate_fractal.m builds on follow_z.m, calling it many times over. We can also do a mini-test on that part (see directions below).

**You need to record how your data was generated**

drive_generator.m records the specific parameters that made the data (c) for each case. In a larger project, you would likely be making many runs, exploring parameters. It is important to record how you made what you made. For example, you might want to answer the question "Do the pictures look different if Re(c)>0 than if Re(c)<0?"

**You want to be able to remake plots and figures easily**

We have separate versions of juliaplot.m for each set of data because your PI will at some point ask you to remake a plot, but change the axes of panel B by 1 and change the legend slightly.

Version controlling the plot scripts, their output, and their writeup will make writing up the paper (and handling reviewer comments) much easier.

# What do you version control, what don't you?

A scientific project will surely change as it develops --- if you already knew how what you were doing was going to turn out, it wouldn't be science, would it? Because of this, early on in a project it might not be clear what results you want to keep around and which ones you won't use (or even the form of what your results are going to be). During this stage, it is likely easier to version control just the results generation part.

Once you transition to writing up your results, you'll want to version control the code that makes the figures (and the figures themselves).

There are different levels of writing up results. Showing something to your PI in lab meeting might not warrant version control. Showing results to a collaborator might, or might not. Definitely when you get to the point of writing a paper you'll want version control.

--- 
# Introduction to Coding
[go here](CodingBasics.mlx)

---

# Project Directions
### Documentation
Step one is documentation. I've done it for you. This is extremely important! Documentation should have at minimum:
* Description of what is in the repo
* Instructions to run an example case

### Code
Specifically, your tasks are to create the following:

* __follow_z.m:__ a *function* which takes in complex numbers z1 and c, then performs the calculation z(n+1)=z(n)^2+c over and over again. It should stop if |z| becomes greater than 2, or n becomes greater than 21. It should output two things: the value of n when it stopped (which we name nmax), and z(1:n).
* __generate_fractal.m:__ a *script* that generates one million points, p(1:1000000), randomly placed in a rectangle bounded by -2 on the left, +2 on the right, -2i on the bottom, and +2i on the top. It should then run followz.m on each of these points and record nmax for each of them (but not z(1:n)).
* __drive_generator.m:__ Provided for you. A *script* which defines the parameter, c, and calls generate_fractal.m. It saves p and n to a data file, juliaset.mat.
* __julia_plot.m:__ Provided for you. A *script* which reads in juliaset.mat and for every point in p(1:1000000), plots a black dot if n<21. As a bonus, it can also plots each point on a color gradient, where n=0 maps to blue and n=22 maps to pink.

### Hints
Things will be easiest if you follow these steps:

1. make follow_z.m first
1. run testcase.m to make sure it works
1. make a simple version of generate_fractal.m (e.g. disp('hello world')). Make sure drive_generator.m runs generate_fractal.m
1. make the part of drive_generator.m that generates random points. To make sure they are within the correct bounds, plot(real(c),imag(c),'o') on a small version of c (1000 points or so instead of the full million)
1. make the part of generate_fractal.m that runs follow_z on each point
1. make 4 versions of drive_generator, each with a different value of c and save their output in 4 different files
1. make 4 versions of julia_plot to load in the different data sets and make 4 fractals

### Some things you may need:
* [~,out2]=fun(args); discards the first output of function fun with 2 outputs without saving it.
* run('path/to/script') runs a script in another directory
* save('path/to/filename.mat','var1','var2') saves a .mat data file with variables var1 and var2 at the specified place
* load('path/to/filename.mat') loads the data saved in filename.mat into matlab
* saveas(gcf,'name.png') saves a plot as a .png image


