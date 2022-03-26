#include "str2num_wrapper.hpp"
#include <stdlib.h>


int    cpmex::str2int   (const char* rhs){ return std::atoi(rhs); }
double cpmex::str2double(const char* rhs){ return std::atof(rhs); }
