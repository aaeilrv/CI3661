```Haskell
type Conjunto a = a -> Bool
```

```Haskell
miembro :: Conjunto a -> a -> Bool
miembro conjunto = conjunto
```

```Haskell
vacio :: Conjunto a
vacio conjunto = False
```

```Haskell
union :: Conjunto a -> Conjunto a -> Conjunto a
union conjunto1 conjunto2 = (\x -> conjunto1 x || conjunto2 x)
```

```Haskell
interseccion :: Conjunto a -> Conjunto a -> Conjunto a
interseccion conjunto1 conjunto2 = (\x -> conjunto1 x && conjunto2 x)
```

```Haskell
complemento :: Conjunto a -> Conjunto a
complemento conjunto = (\x -> not (conjunto x))
```

```Haskell
diferencia :: Conjunto a -> Conjunto a -> Conjunto a
diferencia conjunto1 conjunto2 = (\x -> conjunto1 x && not (conjunto2 x))
```

```Haskell
singleton :: (Eq a) => a -> Conjunto a
singleton elemento = (\x -> x == elemento)
```

```Haskell
desdeLista :: (Eq a) => [a] -> Conjunto a
desdeLista lista = (\x -> x `elem` lista)
```

```Haskell
transformar :: (b -> a) -> Conjunto a -> Conjunto b
transformar f conjunto = (\x -> conjunto (f x))
```