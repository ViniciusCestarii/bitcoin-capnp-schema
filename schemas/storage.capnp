@0xaa2c0b3e6d4f2118;

interface Storage {
    info @0 () -> (info :StorageInfo);
    pruning @1 () -> (pruning :PruningInfo);
}

struct StorageInfo {
    sizeOnDisk @0 :UInt64;
}

struct PruningInfo {
    union {
        disabled @0 :Void;
        enabled @1 :Pruning;
    }
}

struct Pruning {
    pruneHeight @0 :UInt32;

    automatic :union {
        manual @1 :Void;
        targetSize @2 :UInt64;
    }
}
