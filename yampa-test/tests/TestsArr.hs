-- |
-- Module      : TestsArr
-- Description : Test cases for arr
-- Copyright   : Yale University, 2003
-- Authors     : Antony Courtney and Henrik Nilsson
module TestsArr
    ( arr_trs
    , arr_tr
    , arr_st0
    , arr_st0r
    , arr_st1
    , arr_st1r
    )
  where

import FRP.Yampa

import TestsCommon

-- * Test cases for arr

arr_t0 = testSF1 (arr (+1))
arr_t0r =
  [ 1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0
  , 17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0
  ]

arr_t1 = testSF2 (arr (+1))
arr_t1r =
  [ 1.0,1.0,1.0,1.0,1.0,2.0,2.0,2.0,2.0,2.0,3.0,3.0,3.0,3.0,3.0,4.0,4.0,4.0
  , 4.0,4.0,5.0,5.0,5.0,5.0,5.0
  ]

arr_trs =
  [ arr_t0 ~= arr_t0r
  , arr_t1 ~= arr_t1r
  ]

arr_tr = and arr_trs

arr_st0 = testSFSpaceLeak 2000000 (arr (+1))
arr_st0r = 1000000.5

arr_st1 = testSFSpaceLeak 2000000 identity
arr_st1r = 999999.5
