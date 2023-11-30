#include <iostream>
#include <dlfcn.h>
#include <unistd.h>

#define symLoad dlsym



int add(int x, int y);

int main(int argc, char** argv)
{
    std::cout << "Starting up" << std::endl;
    auto result = add(2,8);
    std::cout << "Sum of 2 and 8 is " << result <<  std::endl;
}

int add(int x, int y)
{   
    std::cout << "Loading lib" << std::endl;
    auto handle = dlopen("./aotlib.so", RTLD_LAZY);
    typedef int (*addFunc)(int,int);
    addFunc addFuncHandle = (addFunc)symLoad(handle, "add");    
    std::cout << "Calling add" << std::endl;
    auto result = addFuncHandle(x,y);    
    return result;
}