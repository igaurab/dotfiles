#!/usr/bin/env bash

touch ~/dev/cpp/"$1.cpp" &&
echo '#include<iostream>
using namespace std;


int main(){
return 0;
}
'> ~/dev/cpp/"$1.cpp" &&
vim ~/dev/cpp/"$1.cpp"
