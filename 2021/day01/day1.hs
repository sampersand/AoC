module Main where
import System.IO  
import Control.Monad

readLines :: String -> IO [String]
readLines file = lines <$> readFile file

part1 :: [Int] -> Int
part1 ns = length $ filter (\(a, b) -> a < b) $ zip ns (tail ns)

part2 :: [Int] -> Int
part2 ns = part1 $ zipWith3 (\a b c -> a + b + c) ns (tail ns) (tail $ tail ns)

main :: IO ()
main = do
   -- alternative: contents :: [Int] = map read . lines <$> readFile "day1.txt"
   contents1 <- readLines "day1.txt"
   let contents = (read <$> contents1) :: [Int]
   putStrLn $ "part1: " ++ (show $ part1 contents)
   putStrLn $ "part2: " ++ (show $ part2 contents)
