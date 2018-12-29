module Main where

import           Parser             (parse)
import           RIO                hiding (hClose)
import           RIO.List.Partial   (head)
import           System.Environment (getArgs)
import           System.IO          (IOMode (ReadMode), hClose, hGetContents,
                                     openFile, putStrLn)

main :: IO ()
main = do
  args <- getArgs
  if 1 <= length args then do
    let fileName = head args
    handle <- openFile fileName ReadMode
    contents <- hGetContents handle
    putStrLn . show $ parse contents
    hClose handle
  else
    putStrLn "Argument not specified"
