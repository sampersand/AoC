module Main where
import System.IO  
import Control.Monad

-- main = putStrLn "Hello World"

-- readLines :: String -> IO [String]
-- readLines file = do
--    handle <- openFile file ReadMode
--    contents <- lines <$> hGetContents handle
--    hClose handle
--    pure contents

read2 :: String -> Int
read2 ('+' : rest) = read rest
read2 other = read other

part1 :: [Int] -> Int
part1 = sum

part2 :: [Int] -> Int
part2 list =
   scanl' (+) 0 $ cycle list

main = do  
   contents <- lines <$> readFile "day1.txt"
   let contents' = (read2 <$> contents) :: [Int]
   putStr $ "part1: " ++ (show $ part1 contents') ++ "\n"
   putStr $ "part2: " ++ (show $ part2 contents') ++ "\n"

