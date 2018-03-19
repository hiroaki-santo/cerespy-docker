cmake_minimum_required(VERSION 2.8)

find_package(Boost COMPONENTS python REQUIRED)
find_package(PythonLibs REQUIRED)
include_directories(${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})

add_library(mymodule SHARED mymodule.cc)
target_link_libraries(mymodule ${Boost_LIBRARIES} ${PYTHON_LIBRARY} boost_numpy)
set_target_properties(mymodule PROPERTIES PREFIX "")
