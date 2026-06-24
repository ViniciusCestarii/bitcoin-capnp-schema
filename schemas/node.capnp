@0xb13c0b3e6d4f2119;

interface Node {
    info @0 () -> (info :NodeInfo);
}

struct NodeInfo {
    version @0 :UInt32;
    subversion @1 :Text;
    protocolVersion @2 :UInt32;
    warnings @3 :List(Text);
}
