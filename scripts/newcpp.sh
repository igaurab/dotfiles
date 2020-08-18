#!/usr/bin/env bash

touch "$1.cpp" &&
echo '#include<iostream>
using namespace std;


int main(){
return 0;
}
'> "$1.cpp" &&
nvim "$1.cpp"
