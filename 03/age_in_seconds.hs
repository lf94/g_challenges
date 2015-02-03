import System.Environment
import Numeric

yearsToSeconds :: Double -> Double
yearsToSeconds years = years * 365.2422 * 24 * 60 * 60

main :: IO()
main = do
	args <- getArgs
	case drop 0 args of
		(years:_) -> putStrLn $ showFFloat Nothing (yearsToSeconds $ read years) ""
		[] -> return ()
	
