@0x998b4f7f51e691f7;

interface Network {
    networks @0 () -> (networks :List(NetworkReachability));
    localAddresses @1 () -> (addresses :List(LocalAddress));
    info @2 () -> (info :NetworkInfo);
}

struct NetworkInfo {
    localServices  @0 :UInt64;
    localRelay     @1 :Bool;
    timeOffset     @2 :Int64;
    connectionsIn  @3 :UInt32;
    connectionsOut @4 :UInt32;
    networkActive  @5 :Bool;
}

struct NetworkReachability {
    name                      @0 :Text;
    limited                   @1 :Bool;
    reachable                 @2 :Bool;
    proxy                     @3 :Text;
    proxyRandomizeCredentials @4 :Bool;
}

struct LocalAddress {
    address @0 :Text;
    port    @1 :UInt16;
    score   @2 :Int32;
}
