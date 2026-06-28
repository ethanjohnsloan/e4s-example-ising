This project is supposed to serve as a simple example of a type of project for which E4S could be of benefit.

The base for this project is a simple ising model Monte Carlo simulation for a 32x32 spin lattice, coupling constant of 1, and no external magnetic field. Only nearest neighbors are considered. I chose this since it is an example most people are familiar with. This code is written in FORTRAN77. It outputs snapshots of the lattice configuration in .../outputs/, which can then be made into a gif. The default setting is 200 snapshots. The plotting for the gif is done with a Python script.

Now suppose you want to make this project much bigger and faster. How may you do that? First of all, the files saved in /output/ are way too numerous for a clean and convenient code, and scaling this up would get out of hand. One possible tolution is to use the HDF5 to store and manage all those data. Unfortunately, HDF5 does not support FORTRAN77, so one needs a wrapper, perhaps in C++, to implement this. Another consideration for upscaling this project may be MPI support.

Not think about all the dependencies of this simple example: a FORTRAN compiler, a C++ compiler, an MPI package, and an HDF5 package. You can imagine how quick this can stack up for more complicated examples.

Try running this as in, and you will realize that even this is a slight headache to run without a good environment.

Now, try building this code in an E4S container, and load the needed dependencies in the Spack environment. You should find this much easier, and importantly, very portable.
