➜  sidechecker git:(master) ./spin646_mac -run side_read.pml

pan:1: assertion violated (time1==time2) (at depth 21)
pan: wrote side_read.pml.trail

(Spin Version 6.4.6 -- 2 December 2016)
Warning: Search not completed
+ Partial Order Reduction

Full statespace search for:
never claim         - (none specified)
assertion violations +
cycle checks       - (disabled by -DSAFETY)
invalid end states +

State-vector 160 byte, depth reached 28, errors: 1
       40 states, stored
        3 states, matched
       43 transitions (= stored+matched)
        0 atomic steps
hash conflicts:         0 (resolved)

Stats on memory usage (in Megabytes):
    0.007 equivalent memory usage for states (stored*(State-vector + overhead))
    0.287 actual memory usage for states
  128.000 memory used for hash table (-w24)
    0.534 memory used for DFS stack (-m10000)
  128.730 total actual memory usage



pan: elapsed time 0 seconds

➜  sidechecker git:(master) ./spin646_mac -run side_jump.pml

pan:1: assertion violated (time1==time2) (at depth 21) 
pan: wrote side_jump.pml.trail 

(Spin Version 6.4.6 -- 2 December 2016)
Warning: Search not completed
+ Partial Order Reduction

Full statespace search for:
never claim         - (none specified)
assertion violations +
cycle checks       - (disabled by -DSAFETY)
invalid end states +

State-vector 160 byte, depth reached 28, errors: 1
       40 states, stored
        3 states, matched
       43 transitions (= stored+matched)
        0 atomic steps
hash conflicts:         0 (resolved)

Stats on memory usage (in Megabytes):
    0.007 equivalent memory usage for states (stored*(State-vector + overhead))
    0.285 actual memory usage for states
  128.000 memory used for hash table (-w24)
    0.534 memory used for DFS stack (-m10000)
  128.730 total actual memory usage



pan: elapsed time 0 seconds


