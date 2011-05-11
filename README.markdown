# Scrabble Solver
This scrabble solver is cool for two reasons
1. it comes up with all the possible word combinations, given a set of letters
2. it matches the possible word combinations against a pattern.

## Pattern

* b+ => word that starts with a b

* +b => word that ends with a b

* t_p => word that starts with a T and ends with a B (tip, top, tap)

* t+p+ => word that starts with a T has some string of letters, then a P, then another string of letters (Technophobe, Technophile)

## Next Steps
there are always next steps, but I think there are two immediate problems

1. ability to find words with multiple constraints

=======
b+ => word that starts with a b
+b => word that ends with a b
t_p => word that starts with a T and ends with a B (tip, top, tap)
t+p+ => word that starts with a T has some string of letters, then a P, then another string of letters (Technophobe, Technophile)

## Next Steps
there are always next steps, but I think there are two immediate problems

1. ability to find words with multiple constraints

2. optimizations, it sucks to run the program and have to wait 500ms. 


