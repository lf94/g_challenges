fizzBuzz :: Int -> String
fizzBuzz n | n % 3 == 0 = "Fizz"
           | n % 5 == 0 = "Buzz"
           | n % 3 == 0 && n % 5 == 0 = "FizzBuzz"

main :: IO()
main = do
    mapM_ print $ map fizzBuzz [1..100]