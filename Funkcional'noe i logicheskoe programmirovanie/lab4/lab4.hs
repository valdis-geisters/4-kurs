data ProductType = Milk | Bread | Tea | Sausage
data ProductDef = CDef ProductType Double

productprice (CDef Milk x) = (0.50 + x) + (0.50 + x) * 21 / 100
productprice (CDef Bread x) = (0.10 + x) + (0.10 + x) * 21 / 100
productprice (CDef Tea x) = (0.25 + x) + (0.25 + x) * 21 / 100
productprice (CDef Sausage x) = (1.20 + x) + (1.20 + x)* 21 / 100

calcprice :: [ProductDef] -> [Double]
calcprice [] = []
calcprice (x : xs) = (productprice x : calcprice xs)

sumlist :: [Double] -> Double
sumlist [] = 0
sumlist (x : xs) = x + sumlist xs

-- sumlist(calcprice[(CDef Milk 2), (CDef Bread 1), (CDef Tea 1.2), (CDef Sausage 3)])