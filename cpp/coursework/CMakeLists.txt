cmake_minimum_required(VERSION 3.20)
project(course)

set(CMAKE_CXX_STANDARD 20)

add_executable(
        course main.cpp
        Equations/Equation.cpp
        Equations/Equation.h
)
