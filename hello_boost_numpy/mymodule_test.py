import mymodule
import numpy as np

def func(i):
    A = np.arange(i)
    print "called python func:i={},{}".format(i, A)
    return A

if __name__ == '__main__':
    print mymodule.new_zero(10)
    print mymodule.func_test(10, func)
