# Generate Julia fractals

In this repo is code to generate maps of the Julia set for a parameter c. Here we show 4 different Julia fractals for different values of c.

The codebase folder holds Matlab scripts which generate data. codebase/testcase.m shows the core algorithm gives a known result for a special case.

For an example run, download this folder and copy drive_generator.m to another repository on your computer. Set the correct path for it to find generate_fractal.m and run it. Then copy julia_plot.m to that directory and run it. It will save a image, julia.png.

[fractal_figure.md](analysis/fractal_figure.md) is a figure with four images of Julia fractals at different c values.
