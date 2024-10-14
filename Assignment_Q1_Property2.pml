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
bool waitingProccess;    // will only be true in critical section

ltl {<> waitingProccess} // property 2 (liveness), if satisified, waitingProccess variable in all proccesses became true therefore entered critical section

active[2] proctype P1(){ // active creates instances of processes, [2] means 2 proccesses 
    assert (_pid == 0 || _pid == 1); // make sure that there are only 2 proccesses, and that their identifiers are 0 and 1
again:
    flag[_pid] = 1;
    turn = 1 - _pid;
    (flag[1 - _pid] == 0 || turn == _pid);

    waitingProccess = true;
    // Critical section
    // Checks for property 2 - if a proccess is waiting, eventually it will enter the critical section
    waitingProccess = false;

    flag[_pid] = 0;
    goto again;
}
