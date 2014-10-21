data CarType = Container | Cistern | Passenger
data CarDef = CDef CarType Double

carweight (CDef Container x) = 20 + 50 * x / 100
carweight (CDef Cistern x) = 17 + 60 * x / 100
carweight (CDef Passenger x) = 28 + 18 * x / 100

trainweight :: [CarDef] -> Double
trainweight lst = foldr (+) 100 (map carweight lst)

calcweight :: [CarDef] -> [Double]
calcweight [] = []
calcweight (x : xs) = (carweight x : calcweight xs)

sumlist :: [Double] -> Double 
sumlist [] = 0
sumlist (x : xs) = x + sumlist xs

--sumlist :: [Double] -> Double -> Double
--sumlist [] s = s
--sumlist s (x : xs) = x + sumlist xs (s+x)

--sumlist(calcweight [(CDef Container 100), (CDef Container 50)]) 0