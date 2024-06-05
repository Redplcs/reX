cmake_minimum_required(VERSION 3.8)

project("reX"
    DESCRIPTION "Reverse Engineered code for commX"
    LANGUAGES C CXX)

add_executable(reX WIN32 "src/WinMain.cpp")
