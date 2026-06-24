@0xe10c0b3e6d4f2120;

interface Handle {}

struct BlockHeader {
    version    @0 :Int32;
    prevHash   @1 :Data;
    merkleRoot @2 :Data;
    time       @3 :UInt32;
    bits       @4 :UInt32;
    nonce      @5 :UInt32;
}

interface Transaction {
    raw @0 () -> (data :Data);
    decoded @1 () -> (tx :Tx);
    txid @2 () -> (txid :Data);
    wtxid @3 () -> (wtxid :Data);
    confirmation @4 () -> (confirmation :Confirmation);
}

struct Confirmation {
    union {
        unconfirmed @0 :Void;
        block :group {
            hash   @1 :Data;
            height @2 :UInt32;
        }
    }
}

struct Tx {
    version  @0 :Int32;
    lockTime @1 :UInt32;
    inputs   @2 :List(TxIn);
    outputs  @3 :List(TxOut);
}

struct TxIn {
    prevout   @0 :Outpoint;
    scriptSig @1 :Data;
    sequence  @2 :UInt32;
    witness   @3 :List(Data);
}

struct Outpoint {
    txid @0 :Data;
    vout @1 :UInt32;
}

struct TxOut {
    value        @0 :Int64;
    scriptPubKey @1 :Data;
}
