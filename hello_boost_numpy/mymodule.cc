#include "boost/numpy.hpp"

namespace p = boost::python;
namespace np = boost::numpy;

np::ndarray new_zero(unsigned int N) {
  // return the new array(length=N, all elements is 0)
  p::tuple shape = p::make_tuple(N);
  np::dtype dtype = np::dtype::get_builtin<double>();

  np::ndarray A = np::zeros(shape, dtype);
  return A;
}

float func_test(int i, p::object func){
  // return the sum of array.
  // func must return np.ndarray which length is i.
  p::object A = func(i);
  float sum = 0;
  for(int j = 0; j < i; j++){
    sum += p::extract<float>(A[j]);
  }
  return sum;
}

BOOST_PYTHON_MODULE(mymodule) {
  Py_Initialize();
  np::initialize();

  p::def("new_zero", new_zero);
  p::def("func_test", func_test);
}
