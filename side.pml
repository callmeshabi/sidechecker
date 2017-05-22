proctype pagetable(chan ret; short start)
{
    short time
    time = 10
    time = start + time
    ret!time
}

proctype TLB(chan ret; short start)
{
    short time
    time = 5
    time = start + time
    ret!time    
}

proctype start(chan ret)
{
    if 
    :: run pagetable(ret, 0)
    :: run TLB(ret, 0)
    fi
}

init {
    chan ret_chan1 = [1] of { short }
    chan ret_chan2 = [1] of { short }
    short time1, time2
    run start(ret_chan1)
    run start(ret_chan2)
    ret_chan1?time1
    ret_chan2?time2
    assert(time1 == time2)
}
