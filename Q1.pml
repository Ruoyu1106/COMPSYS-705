#define N 3 // Number of processes, can be changed as needed

byte pos[N]; // Array representing each process's stage
byte step[N-1]; // Array representing the last process at each stage

active [N] proctype PetersonProcess() {
    byte i = _pid; // Current process ID
    
    // Initialization
    pos[i] = 0;

    // Multi-stage mutual exclusion control
    int j;
    do
    :: for (j : 0 .. N-2) {
            pos[i] = j; // Record the current stage of process i
            step[j] = i; // Record that process i is the last to reach stage j

            // Wait until allowed to proceed to the next stage
            do
            :: {
                int k;
                bool proceed = true;

                // Check if any other process is at or beyond the current stage
                for (k : 0 .. N-1) {
                    if
                    :: (k != i && pos[k] >= j) -> proceed = false; break;
                    :: else -> skip;
                    fi;
                }

                // Check if any other process is the last at the current stage
                for (k : 0 .. N-1) {
                    if
                    :: (step[j] == k && k != i) -> proceed = false; break;
                    :: else -> skip;
                    fi;
                }

                // Debugging output to check the current state of proceed
                printf("Process %d, stage %d, proceed: %d\n", i, j, proceed);

                // If both checks pass, proceed
                if
                :: proceed -> break;
                :: else -> skip;
                fi;
            }
            od;
       }    
    od;
}

