#define dTLB_ACCESS_TIME 10
#define iTLB_ACCESS_TIME 8
#define CACHE_PTE_TO_TLB_TIME 5
#define CHECK_PAGE_PRIVILEGE_LEVEL_TIME 20
#define PAGETABLE_WALK_TIME_MAX 40
#define PAGETABLE_MISS_TIME 1000
#define iCACHE_ACCESS_TIME 5
#define dCACHE_ACCESS_TIME 9

mtype = {X, NX, U};
typedef Address {
    mtype type;
    short time;
    bool dTLB, iTLB, PageTable, iCACHE;
}


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

proctype start(chan ret, chan ret_address)
{
    Address probe
    short time
    ret?time
    time = dTLB_ACCESS_TIME
    ret_address?probe
    if 
    :: probe.dTLB == true -> ret!time
    :: probe.dTLB == false -> run pagetable(chan ret, chan ret_address)
    fi
}

proctype addressTypeInit(chan ret_address)
{
    Address probe
    if
    :: skip ->
        probe.type = X
        if :: probe.dTLB = true :: probe.dTLB = false fi
        if :: probe.iTLB = true :: probe.iTLB = false fi
        if :: probe.PageTable = true :: probe.PageTable = false fi
        if :: probe.iCACHE = true :: probe.iCACHE = false fi
    :: skip ->
        probe.type = NX
        if :: probe.dTLB = true :: probe.dTLB = false fi
        if :: probe.iTLB = true :: probe.iTLB = false fi
        if :: probe.PageTable = true :: probe.PageTable = false fi
        if :: probe.iCACHE = true :: probe.iCACHE = false fi
    :: skip ->
        probe.type = U
        if :: probe.dTLB = false fi
        if :: probe.iTLB = false fi
        if :: probe.PageTable = false fi
        if :: probe.iCACHE = false fi
    fi
    ret_address!probe
}



init {
    chan ret_chan1 = [1] of { short }
    chan ret_chan2 = [1] of { short }
    chan ret_address = [2] of {Address}
    short time1, time2
    Address probe1, probe2
    run addressTypeInit(ret_address)
    run addressTypeInit(ret_address)
    run start(ret_chan1, ret_address)
    run start(ret_chan2, ret_address)
    ret_chan1?time1
    ret_chan2?time2
    assert(time1 == time2)
}
