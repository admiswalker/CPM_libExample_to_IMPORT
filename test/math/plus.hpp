#pragma once


TEST(math_plus, plus_ii){
    ASSERT_EQ(cpmex::plus_ii(1, 1), (int)2);
}
TEST(math_plus, plus_dd){
    ASSERT_EQ(cpmex::plus_dd(1, 1), (double)2.0);
}
