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



#define N 2 // Number of processes, can be changed as needed
bool turn;
byte flag[N];
byte step[N]; // step array for Peterson's algorithm stages

byte numProcesses; // counter for the number of processes currently in critical section
bool waitProcess;

// Property 1 (safety): Multiple processes cannot enter the critical section together
ltl P1_safety { [](numProcesses <= 1) }

// Property 2 (liveness): If a process is waiting, eventually it will enter the critical section
// ltl P2_liveness1 { [](flag[0] == 1 -> <> (waitProcess && _pid == 0)) }
// ltl P2_liveness2 { [](flag[1] == 1 -> <> (waitProcess && _pid == 1)) }
ltl P2_liveness{<> waitProcess}

// Property 3 (liveness): Any process not in the critical section will eventually enter
ltl P3_liveness { [](! (numProcesses == 1) -> <> (numProcesses == 1)) }

active[2] proctype P1() {
    assert (_pid == 0 || _pid == 1);  // ensure that there are only 2 processes, with IDs 0 and 1

    do
    :: flag[_pid] = 1;
       turn = 1 - _pid;
       step[_pid] = 0; // initialize step for the process

       // Wait until the other process is not in critical section or it is this process's turn
       do
       :: (flag[1 - _pid] == 0 || turn == _pid || step[1 - _pid] < step[_pid]) -> break
       od;

       waitProcess = true;  // process is in the critical section
       atomic { // ensure mutual exclusion
           numProcesses++;
           assert(numProcesses == 1);  // mutual exclusion assertion
       }

       // Critical section
       atomic { // ensure mutual exclusion
           numProcesses--;
           waitProcess = false;  // leaving critical section
       }

       // Exit critical section
       flag[_pid] = 0;
    od
}