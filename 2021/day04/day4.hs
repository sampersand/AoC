module Main where
import System.IO  
import Control.Monad
import Data.Foldable
import Data.List
import Data.Set (Set, fromList, isSubsetOf)

type BingoBoard = [[Integer]]

readLines :: String -> IO [String]
readLines file = lines <$> readFile file

splitOn :: Char -> String -> [String]
splitOn c s = case dropWhile (== c) s of
   "" -> []
   s' -> w : splitOn c s''
      where (w, s'') = break (== c) s'

readInt :: String -> Integer
readInt = read


(<$$>) :: (a -> b) -> [[a]] -> [[b]]
(<$$>) fn list = (\x -> fn <$> x) <$> list


readBingoBoard :: [String] -> BingoBoard
readBingoBoard inp = readInt <$$> (splitOn ' ' <$> inp )

readBingoBoards :: [String] -> [BingoBoard]
readBingoBoards [] = []
readBingoBoards l = (readBingoBoard $ take 5 l) : (readBingoBoards $ drop 6 l)

boardWins :: [Integer] -> BingoBoard -> Bool
boardWins nums board = any (flip isSubsetOf sn) sb
   where
      sn = fromList nums
      sb = (fromList <$> board) ++ (fromList <$> transpose board)

part1 :: [Integer] -> [BingoBoard] -> BingoBoard
part1 nums boards = go 5
   where
      go n = 
         case find (boardWins $ take n nums) boards of
            Just board -> nums !! n * board
            Nothing -> go $ n + 1

main :: IO ()
main = do
   x <- readLines "day4.txt"
   let nums = fmap readInt $ splitOn ',' $ head x
   let boards = readBingoBoards $ drop 2 x
   -- let b = [[14,21,17,24, 4], [10,16,15, 9,19], [18, 8,23,26,20], [22,11,13, 6, 5], [2, 0,12, 3, 7]]

   -- print $ boardWins [7,4,9,5,11,17,23,2,0,14,21,24,10] b
   -- print boards
   print $ part1 nums boards
   -- print $ groupBy (\a b -> a != b) $ tail $ tail x
   -- print x
