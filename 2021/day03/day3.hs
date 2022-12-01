module Main where
import System.IO  
import Control.Monad
import Data.Foldable
import Data.List (sort, transpose)
import Data.Char (digitToInt)
import Numeric (readInt)
import Debug.Trace

readLines :: String -> IO [String]
readLines file = lines <$> readFile file

mostCommon :: String -> Char
mostCommon s = (sort s) !! (length s `div` 2)

part1 :: String -> Int
part1 common = (readBin' common) * (readBin' $ fc <$> common)
   where
      fc '0' = '1'
      fc '1' = '0'

part2 :: String -> [String] -> Int
part2 common contents = undefined
   where
      foo = trace "A" (take 10 $ zip common contents)
{-

def reduce!(ary, index, method)
  select = ary
    .transpose[index]
    .tally
    .values_at('0', '1')
    .reduce(&method) ? '0' : '1'

  ary.select! { _1[index] == select }
end

data1=data.dup
data.first.size.times do |index|
  reduce!(data, index, :>) unless data.one?
  reduce!(data1, index, :<=) unless data1.one?
end

puts "part2: #{data[0].join.to_i(2) * data1[0].join.to_i(2)}"

-}
readBin :: (Eq a, Num a) => ReadS a
readBin = readInt 2 (`elem` "01") digitToInt

readBin' :: String -> Int
readBin' s = fst $ readBin s !! 0

main :: IO ()
main = do
   contents <- pure $ lines "\
      \00100\n\
      \11110\n\
      \10110\n\
      \10111\n\
      \10101\n\
      \01111\n\
      \00111\n\
      \11100\n\
      \10000\n\
      \11001\n\
      \00010\n\
      \01010"
   contents <- readLines "day3.txt"
   let common = mostCommon <$> transpose contents
   print $ part1 common
   print $ part2 common contents
