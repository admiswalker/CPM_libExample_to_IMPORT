#include <cpmex/cpmex.hpp>
#include <gtest/gtest.h>


#include "test/str2num_wrapper.hpp"
#include "test/math/plus.hpp"
#include "test/math/minus.hpp"


int main(int argc, char** argv){
    printf("\n");
    printf("+---------------------------------------------------+\n");
    printf("|                                                   |\n");
    printf("|       Welcome to CPM_libExample_to_IMPORT !       |\n");
    printf("|                                                   |\n");
    printf("+---------------------------------------------------+\n");
    printf("\n");
    ::testing::InitGoogleTest(&argc, argv);
    
    auto ret = RUN_ALL_TESTS();
    
    printf("\n");
    return ret;
}
