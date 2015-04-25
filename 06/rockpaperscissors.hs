import System.Random
import Control.Concurrent

data Hand = Rock | Paper | Scissors
	deriving(Show,Eq,Ord,Enum,Bounded)

instance Random Hand where
	randomR (a,b) g = (toEnum a', g')
		where 
			(a',g') = randomR (fromEnum a, fromEnum b) g
	random g = randomR (minBound, maxBound) g

inputToHand :: String -> Maybe Hand
inputToHand str
	| (take 1 str) == "r" = Just Rock
	| (take 1 str) == "p" = Just Paper
	| (take 1 str) == "s" = Just Scissors
	| otherwise = Nothing

main :: IO()
main = do
	print "Rock!"
	_ <- threadDelay(1000000)
	print "Paper!"
	_ <- threadDelay(1000000)
	print "Scissors!"
	userHandString <- getLine
	let userHand = inputToHand userHandString
	case userHand of
		Just hand -> do
			hand <- (randomIO:: IO Hand)
			print ("Computer draws "++(show hand)++"!")
		Nothing -> return()

