import System.Random

main :: IO()
main = do
	generator <- getStdGen
	print $ coin !! head (randomRs (0,1) generator)
	where
		coin = ["Heads", "Tails"]
