arbolEjemplo :: ArbolMB Int
arbolEjemplo =
  RamaB 3
    (RamaB 1 (RamaM 1 Vacio) (RamaM 2 Vacio))
    (RamaB 5 (RamaM 4 Vacio) Vacio)

data ArbolMB a = Vacio
                | RamaM a (ArbolMB a)
                | RamaB a (ArbolMB a) (ArbolMB a)

-- a)
ramaB :: a -> ArbolMB a -> ArbolMB a -> ArbolMB a

Vacio :: ArbolMB a

-- b)

transformarRamaM :: a -> b -> b

transformarRamaB :: a -> b -> b -> b

transformarVacio :: b

-- c)
plegarArbolMB :: b -> (a -> b -> b) -> (a -> b -> b -> b) -> ArbolMB a -> b
plegarArbolMB transVacio transRamaM transRamaB = plegar
    where
        plegar Vacio = transVacio
        plegar (RamaM x y) = transRamaM x (plegar y)
        plegar (RamaB x y z) = transRamaB x (plegar y) (plegar z)

-- d)
sumarArbolMB :: (Num a) => ArbolMB a -> a
sumarArbolMB plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = 0
        transRamaM x y = x + y
        transRamaB x y z = x + y + z

-- e)
aplanarArbol :: ArbolMB a -> [a]
aplanarArbol plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = []
        transRamaM x y = x : y
        transRamaB x y z = x : y ++ z

-- f)
analizarArbolMB :: (Ord a) => ArbolMB a -> Maybe (a, a, Bool)
analizarArbolMB = plegarArbolMB transVacio transRamaM transRamaB
    where
        transVacio = Nothing
        transRamaM x = \case
            Nothing -> Just (x, x, True)
            Just (minimo, maximo, esArbolBinario) -> Just (min x minimo, max x maximo, esArbolBinario)
        transRamaB x y z = \case
            Nothing -> Just (x, x, y <= x && x <= z)
            Just (minimo, maximo, esArbolBinario) -> Just (min x minimo, max x maximo, esArbolBinario && y <= x && x <= z)

-- g)
Debe tomar n funciones.

-- h)
foldr.