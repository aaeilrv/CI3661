esPar :: Integer -> Bool
esPar = even

esImpar :: Integer -> Bool
esImpar = odd

esParoImpar :: Integer -> Bool
esParoImpar x = esPar x || esImpar x

---

esPositivo :: Integer -> Bool
esPositivo x = x > 0

esNegativo :: Integer -> Bool
esNegativo x = x < 0

esPositivoYPar :: Integer -> Bool
esPositivoYPar x = esPositivo x && esPar x

---

mayoresADiez :: Integer -> Bool
mayoresADiez x = x > 10

z = complemento mayoresADiez 5

---

type Conjunto a = a -> Bool

miembro :: Conjunto a -> a -> Bool
miembro conjunto = conjunto

vacio :: Conjunto a
vacio conjunto = False

union :: Conjunto a -> Conjunto a -> Conjunto a
union conjunto1 conjunto2 = (\x -> conjunto1 x || conjunto2 x)

interseccion :: Conjunto a -> Conjunto a -> Conjunto a
interseccion conjunto1 conjunto2 = (\x -> conjunto1 x && conjunto2 x)

complemento :: Conjunto a -> Conjunto a
complemento conjunto = (\x -> not (conjunto x))

diferencia :: Conjunto a -> Conjunto a -> Conjunto a
diferencia conjunto1 conjunto2 = (\x -> conjunto1 x && not (conjunto2 x))

singleton :: (Eq a) => a -> Conjunto a
singleton elemento = (\x -> x == elemento)

desdeLista :: (Eq a) => [a] -> Conjunto a
desdeLista lista = (\x -> x `elem` lista)

transformar :: (b -> a) -> Conjunto a -> Conjunto b
transformar f conjunto = (\x -> conjunto (f x))