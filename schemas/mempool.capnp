@0xc14c0b3e6d4f211a;

interface Mempool {
    testAccept @0 (tx :Data, maxFeeRate :Int64) -> (result :Acceptance);
    submit @1 (tx :Data, maxFeeRate :Int64) -> (result :Acceptance);
}

struct Acceptance {
    union {
        accepted @0 :Void;
        rejected @1 :Text;
    }
}
