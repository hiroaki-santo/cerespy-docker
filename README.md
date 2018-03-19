# cerespy-docker

**Ceres Solver (Ceres)** is an open source solver for Non-linear Least Squares problems (http://ceres-solver.org/).
Python is often used for data analysis, but **Ceres** is C++ library.
By using **Boost.Numpy** we can call **Ceres** from Python.

# Build/Run

## Build
```
$ git pull https://github.com/hiroaki-santo/cerespy-docker.git
$ cd cerespy-docker
$ docker build -t cerespy-docker .
```

## Run
```
$ docker run -it cerespy-docker bash
```

# Sample code
This image includes sample codes for **Ceres** (``hello_ceres``) and **Boost.Numpy** (``hello_boost_numpy``).

## hello_ceres
```
$ cd ./hello_ceres
$ cmake . && make
$ ./hello_ceres
```

## hello_boost_numpy
```
$ cd ./hello_boost_numpy
$ cmake . && make
$ python mymodule_test.py
```
