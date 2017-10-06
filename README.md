# Makefile for TSU OpenMP course
---

Simple Makefile that build most of the projects for the course. Makefile must be placed into the folder with _main.cpp_ file.

Make invocations:
- `make` -- compile all _*.cpp_ files into _Debug/main_ executable
- `make run` -- compile and run
- `make clean` -- remove all binary and executable files in Debug folder
- `make convert` -- convert sources from _cp1551_ to _utf-8_ encoding (requires **iconv**)
