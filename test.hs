module Main where
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

main :: IO ()
main = do
     args <- getArgs
     putStrLn ("Hello, " ++ args !! 0)

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input = case parse symbol "lisp" input of
                   Left err -> "No match: " ++ show err
                   Right val -> "Found value"
