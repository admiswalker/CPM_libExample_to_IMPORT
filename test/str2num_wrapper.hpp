#pragma once


TEST(str2num_wrapper, str2int){
    ASSERT_EQ(cpmex::str2int("10"), (int)10);
}
TEST(str2num_wrapper, str2double){
    ASSERT_EQ(cpmex::str2double("1.0"), (double)1.0);
}
