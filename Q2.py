from z3 import *

def main():
    # Defining Boolean variables
    A = Bool('A')
    B = Bool('B')
    C = Bool('C')

    # Define Equation Y and Y'
    # 1). Y = (¬A /\ B /\ C) \/ (A /\ ¬B /\ C) \/ (A /\ B /\ ¬C) \/ (A /\ B /\ C)
    # 2). Y_prime = (A /\ B) \/ (B /\ C) \/ (A /\ C) – (2)
    Y = Or(And(Not(A), B, C), And(A, Not(B), C), And(A, B, Not(C)), And(A, B, C))
    Y_prime = Or(And(A, B), And(B, C), And(A, C))

    # Create Solver
    solver = Solver()

    # Check if Y and Y' are equivalent
    # If they are not equivalent, then (Y != Y') should be true for some A, B, C
    solver.add(Y != Y_prime)

    # Check if there is a solution
    if solver.check() == sat:
        print("Equation 1 and Equation 2 are not equivalent.")
        # Print an example that makes the two not equivalent
        model = solver.model()
        print("Variable values ​​when not equivalent:")
        print(f"A: {model[A]}, B: {model[B]}, C: {model[C]}")
    else:
        print("Equation 1 and Equation 2 are equivalent.")
    
if __name__ == '__main__':
    main()