#include <chrono>
#include <cpmex/cpmex.hpp>
#include <gtest/gtest.h>


#include "test/str2num_wrapper.hpp"
#include "test/math/plus.hpp"
#include "test/math/minus.hpp"


typedef std::chrono::system_clock::time_point time_m;
void measureTime_start(time_m& startTime){
    startTime = std::chrono::system_clock::now();
}
void measureTime_stop_print(const time_m& startTime){
    time_m endTime = std::chrono::system_clock::now();
    auto usec = std::chrono::duration_cast<std::chrono::microseconds>(endTime-startTime).count();
    unsigned long long ms = ((double)usec) / 1000.0;
    
    unsigned long long msec = ms;
    unsigned long long  sec = msec / 1000; msec -= sec*1000; unsigned long long sec_all = sec;
    unsigned long long    m =  sec /   60;  sec -=   m*60;
    unsigned long long    h =    m /   60;    m -=   h*60;
    unsigned long long  day =    h /   24;    h -= day*24;

    printf("---------------------------------------------------\n");
    printf(" Execution time: %5llu day %2llu h %2llu m %2llu. %03llu sec\n", day, h, m, sec, msec);
    printf("                 ( %20llu. %03llu sec ) \n", sec_all, msec);
    printf("---------------------------------------------------\n");
}


int main(int argc, char** argv){
    printf("\n");
    printf("+---------------------------------------------------+\n");
    printf("|                                                   |\n");
    printf("|       Welcome to CPM_libExample_to_IMPORT !       |\n");
    printf("|                                                   |\n");
    printf("+---------------------------------------------------+\n");
    printf("\n");
    printf("■ measureTime_start---------------\n\n"); time_m timem; measureTime_start(timem);
    ::testing::InitGoogleTest(&argc, argv);
    
    auto ret = RUN_ALL_TESTS();
    
    printf("\n");
    printf("■ measureTime_stop----------------\n");
    measureTime_stop_print(timem);
    printf("\n");
    return ret;
}
