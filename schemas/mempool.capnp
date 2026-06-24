@0xc14c0b3e6d4f211a;

using Common = import "common.capnp";

interface Mempool {
    testAccept @0 (tx :Data, maxFeeRate :Int64) -> (result :Acceptance);
    submit @1 (tx :Data, maxFeeRate :Int64) -> (result :Acceptance);

    handleNotifications @2 (handler :MempoolNotifications) -> (handle :Common.Handle);

    info @3 () -> (info :MempoolInfo);
}

struct MempoolInfo {
    relayFee       @0 :Int64;
    incrementalFee @1 :Int64;
}

interface MempoolNotifications {
    transactionAdded @0 (tx :Common.Transaction) -> ();
    transactionRemoved @1 (tx :Common.Transaction, reason :RemovalReason) -> ();
}

enum RemovalReason {
    expiry @0;
    sizeLimit @1;
    reorg @2;
    block @3;
    conflict @4;
    replaced @5;
}

struct Acceptance {
    union {
        accepted @0 :Void;
        rejected @1 :Text;
    }
}
