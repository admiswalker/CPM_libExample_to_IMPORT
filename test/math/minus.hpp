#pragma once


TEST(math_minus, minus_ii){
    ASSERT_EQ(cpmex::minus_ii(1, 1), (int)0);
}
TEST(math_minus, minus_dd){
    ASSERT_EQ(cpmex::minus_dd(1, 1), (double)0.0);
}
