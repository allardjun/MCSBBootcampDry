# Rapid function evaluation and C

## 1. Getting to the nucleus
Simulate a transcription factor getting from cell surface to nuclear pore complex

Examples from biology:
- [Wnt pathway](https://www.nature.com/articles/onc2016304/figures/1)
- [Yap-Taz pathway](https://www.nature.com/articles/s41580-018-0086-y)

## 2. Matlab
 - Figure(1) on versus off
 - It's slow
 - The tails of the distribution: log the histogram

## 3. C example
 - The procedure of compiling

```
gcc -lm main.c
./a.out
```

 - Runtime comparison

## 4. C is fast.
 - Web search ["as fast as c"](https://www.google.com/search?q="as+fast+as+c") or ["c like speed"](https://www.google.com/search?q="c+like+speed")

## 5. What is compilation and why is C fast?
 - Low-level to high-level continuum
  - Languages must be translated into machine code before running. "Interpreted" languages (R, Matlab, Python) do most of the translation as the code is executing. "Compiled" languages (C, C++, Fortran) do most of the translation ahead of time. There is a continuum in between these.
 - Variable typing
 - Compilation is machine-specific.
 - Array overrun example
 - An example of why high-level languages are nice: Matlab parfor.

## 6. C is annoying.
When writing the example in C, I got annoyed several times:
 - I had to square a quantity.
 - I had to define pi.
 - Defining nSamples was done in a "macro" unlike other parameters
 - To debug, I used printf statements.

## 7. Julia

## 8. Using C (or other compiled language like Fortran) in your workflow
 - Many high-level languages compile certain functions (Matlab matrix operations,...)
 - You can compile C and wrap it in many high-level languages (Python, R, Matlab)
 - You can live in a two-language paradigm.
