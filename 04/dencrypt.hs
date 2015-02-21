import Data.Char
import System.Environment

rot13 str = map (\x -> chr $ (+) (ord x) 13) str
unrot13 str = map (\x -> chr $ (-) (ord x) 13) str

main :: IO()
main = do
	args <- getArgs
	putStrLn $ case args of
		["0",str] -> unrot13 str
		["1",str] -> rot13 str
		[] -> "No parameters"
		otherwise -> "Invalid parameters"
