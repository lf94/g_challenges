import Data.Char
import System.Environment

rot13 = map add13
add13 ch 
	| isAlpha lch = (chr . add13_) lch
	| otherwise = lch
	where lch = toLower ch

add13_ ch 
	| ochr > oZ = (ochr - oZ) + ord 'a' - 1
	| ochr <= oZ = ochr
	where 
		ochr = 13 + ord ch
		oZ = ord 'z'

main :: IO()
main = do
	args <- getArgs
	putStrLn $ case args of
		(str:_) -> rot13 str
		otherwise -> "Invalid parameters"
