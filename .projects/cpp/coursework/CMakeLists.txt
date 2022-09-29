cmake_minimum_required(VERSION 3.20)
project(coursework)

set(CMAKE_CXX_STANDARD 20)

add_executable(
        course main.cpp
        Matrix/Matrix.cpp
        Matrix/Matrix.h
        Calculations/calc.cpp
        Calculations/calc.h
)
