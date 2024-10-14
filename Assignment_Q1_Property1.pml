/*
Unary Operators (unop):
	[]	(the temporal operator always)
	<>	(the temporal operator eventually)
	! 	(the boolean operator for negation)

Binary Operators (binop):
	U 	(the temporal operator strong until)
	W	(the temporal operator weak until (only when used in inline formula)
	V 	(the dual of U): (p V q) means !(!p U !q))
	&&	(the boolean operator for logical and)
	||	(the boolean operator for logical or)
	/\	(alternative form of &&)
	\/	(alternative form of ||)
	->	(the boolean operator for logical implication)
	<->	(the boolean operator for logical equivalence)
*/

bool turn, flag[2];
byte numCriticalProcesses; // counter for the number of processes currently in critical section

ltl {[](numCriticalProcesses != 2)} // property 1 (safety)

active[2] proctype P1() { // active creates instances of processes, [2] means 2 processes
    assert (_pid == 0 || _pid == 1); // make sure that there are only 2 processes, and that their identifiers are 0 and 1

    do
    :: flag[_pid] = 1;
       turn = 1 - _pid;

       // Wait until the other process is not in critical section or it is this process's turn
       do
       :: (flag[1 - _pid] == 0 || turn == _pid) -> break
       od;

       numCriticalProcesses++;
       assert(numCriticalProcesses <= 1); // Ensure mutual exclusion before entering critical section

       // Critical Section
       printf("Process %d is in the Critical Section\n", _pid);
       
       numCriticalProcesses--;

       // Exit critical section
       flag[_pid] = 0;
    od
}