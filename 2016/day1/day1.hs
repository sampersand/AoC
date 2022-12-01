module Main where
import System.IO  
import Control.Monad
import Data.Complex
import Debug.Trace


(<$$>) f src = (\x -> f <$> x) <$> src

type Position = Complex Double
type Heading = (Position, Position)

i :: Position
i = 0 :+ 1

move :: Heading -> String -> Heading
move (pos, dir) (d:n) = (pos + dir' * ((read n) :+ 0), dir')
   where
      dir' = case d of
            'L' -> dir * i
            'R' -> dir * (-i)
            otherwise -> dir

contains :: Foldable t => Eq a => t a -> a-> Bool
contains xs x = any (==x) xs

firstRevisit :: ([Position], Heading, Bool) -> String -> ([Position], Heading, Bool)
firstRevisit a @ (_, _, True) _ = a
firstRevisit (visited, current, False) direction =
   if contains visited (fst new) then (visited, new, True) else ((fst new) : visited, new, False)
   where new = move current direction



flatten :: [[a]] -> [a]
flatten [] = []
flatten (f:xs) = f ++ flatten xs

fix :: String -> String
fix (',':[]) = []
fix (l:[]) = pure l
fix (l:r) = l : fix r

fix2 :: String -> [String]
fix2 (c:rest) = (c : "1") : take ((read rest) - 1) (repeat "-1")

taxicab :: Position -> Double
taxicab pos = (abs $ realPart pos) + (abs $ imagPart pos)

main = do  
   contents <- readFile "day1.txt"
   let contents' = flatten $ (fix2 . fix) <$$> words $ contents

   let initial = (0 :+ 0, i)
   let (part1, _) = foldl move initial contents'
   putStrLn $ show $ taxicab part1

   let (_, (part2, _), _) = foldl firstRevisit ([], initial, False) contents'
   putStrLn $ show $ taxicab part2
