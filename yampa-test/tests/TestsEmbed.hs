-- |
-- Module      : TestsEmbed
-- Description : Test cases for embedding
-- Copyright   : Yale University, 2003
-- Authors     : Antony Courtney and Henrik Nilsson
module TestsEmbed (embed_tr, embed_trs) where

import FRP.Yampa

import TestsCommon

------------------------------------------------------------------------------
-- Test cases for embedding
------------------------------------------------------------------------------

embed_ratio :: SF a Double
embed_ratio = switch (constant 1.0 &&& after 5.0 ()) $ \_ ->
              switch (constant 0.0 &&& after 5.0 ()) $ \_ ->
              constant 3.0

embed_sf :: SF a Double
embed_sf = localTime >>> integral

embed_t0 = take 20 $ embed (embed_ratio
                            >>> embedSynch embed_sf
                                           (deltaEncode 0.01 (repeat ())))
                           (deltaEncode 1.0 (repeat ()))

embed_t0r =
    [  0.0000,   0.4851,   1.9701,    4.4850,   7.9800,
       7.9800,   7.9800,   7.9800,    7.9800,   7.9800,
      24.4650,  49.9500,  84.4350,  127.9200, 180.2151,
     241.6701, 312.1251, 391.5801, 480.03510, 577.4901]


embed_t1 = take 20 $ embed (embed_ratio
                            >>> embedSynch embed_sf
                                           (deltaEncode 0.5 (replicate 30 ())))
                           (deltaEncode 1.0 (repeat ()))

embed_t1r =
    [   0.00,   0.25,   1.50,   3.75,   7.00,
        7.00,   7.00,   7.00,   7.00,   7.00,
       22.75,  47.50,  81.25, 101.50, 101.50,
      101.50, 101.50, 101.50, 101.50, 101.50]

embed_trs =
    [ embed_t0 ~= embed_t0r,
      embed_t1 ~= embed_t1r
    ]


embed_tr = and embed_trs