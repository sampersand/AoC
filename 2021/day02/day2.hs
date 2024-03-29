module Main where
import System.IO  
import Control.Monad
import Data.Foldable

readLines :: String -> IO [String]
readLines file = lines <$> readFile file

classify :: String -> (Char, Int)
classify line = (head wl, read wr)
   where (wl:wr:_) = words line


part1 :: [String] -> Int
part1 ls = h*d
   where
      (h,d) = foldl' go (0,0) (classify <$> ls)
      go (h,d) ('f', x) = (h+x, d)
      go (h,d) ('u', x) = (h, d-x)
      go (h,d) ('d', x) = (h, d+x)

part2 :: [String] -> Int
part2 ls = h*d
   where
      (h,d,_) = foldl' go (0,0,0) (classify <$> ls)
      go (h, d, a) ('f', x) = (h + x, d + a*x, a)
      go (h, d, a) ('d', x) = (h, d, a + x)
      go (h, d, a) ('u', x) = (h, d, a - x)

main :: IO ()
main = do
   contents <- readLines "day2.txt"
   putStrLn $ "part1: " ++ (show $ part1 contents)
   putStrLn $ "part2: " ++ (show $ part2 contents)
