import System.Random.Shuffle
import System.Random

shuffleS :: RandomGen gen => [a] -> gen -> [a]
shuffleS xs g = shuffle' xs (length xs) g

main :: IO()
main = do
	generator <- getStdGen 
	firstNamesFile <- readFile "./first_names.txt"
	lastNamesFile <- readFile "./last_names.txt"
	let firstNames = shuffleS (lines firstNamesFile) generator
	let lastNames = shuffleS (lines lastNamesFile) generator
	print $ (head firstNames) ++ " " ++ head lastNames
