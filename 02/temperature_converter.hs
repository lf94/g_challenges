import System.Environment

convertTemperature :: Double -> Char -> Char -> Maybe Double
convertTemperature a f t 
	| f == 'c' && t == 'k' = Just (celciusToKelvin a)
	| f == 'c' && t == 'f' = Just (celciusToFahrenheit a)
	| f == 'f' && t == 'c' = Just (fahrenheitToCelcius a)
	| f == 'f' && t == 'k' = Just (fahrenheitToKelvin a)
	| f == 'k' && t == 'c' = Just (kelvinToCelcius a)
	| f == 'k' && t == 'f' = Just (kelvinToFahrenheit a)
	| otherwise = Nothing

celciusToKelvin :: Double -> Double
celciusToKelvin a = a + 273.15

celciusToFahrenheit :: Double -> Double
celciusToFahrenheit a = a * (9.0 / 5.0) + 32.0

fahrenheitToCelcius :: Double -> Double
fahrenheitToCelcius a = (a - 32.0) * 5.0 / 9.0

fahrenheitToKelvin :: Double -> Double
fahrenheitToKelvin = fahrenheitToCelcius . celciusToKelvin

kelvinToCelcius :: Double -> Double
kelvinToCelcius a = a - 273.15

kelvinToFahrenheit :: Double -> Double
kelvinToFahrenheit = kelvinToCelcius . celciusToFahrenheit

main :: IO()
main = do
	args <- getArgs
	print $ convertTemperature (read $ args !! 0) (head $ args !! 1) (head $ args !! 2)
