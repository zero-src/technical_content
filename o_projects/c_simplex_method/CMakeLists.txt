cmake_minimum_required(VERSION 3.20)
project(learn_cpp)

set(CMAKE_CXX_STANDARD 20)

add_executable(learn_cpp main.cpp Drawing/Renderer.cpp Drawing/Renderer.h Maths/Equation.cpp Maths/Equation.h includes.h)
