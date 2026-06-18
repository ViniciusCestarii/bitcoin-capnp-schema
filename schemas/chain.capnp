@0x888b4f7f51e691f7;

interface Chain {
    tip @0 () -> (block :Block);
    blockByHash @1 (hash :Data) -> (block :Block, found :Bool);
    blockByHeight @2 (height :UInt32) -> (block :Block, found :Bool);

    status @3 () -> (status :ChainStatus);
    info @4 () -> (info :ChainInfo);

    transactionByTxid @5 (txid :Data) -> (transaction :Transaction, found :Bool);
    utxoByOutpoint @6 (outpoint :Outpoint) -> (utxo :Utxo, found :Bool);
}

interface Block {
    header @0 () -> (header :BlockHeader);
    raw @1 () -> (data :Data);
    height @2 () -> (height :UInt32);
    hash @3 () -> (hash :Data);
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

struct BlockHeader {
    version    @0 :Int32;
    prevHash   @1 :Data;
    merkleRoot @2 :Data;
    time       @3 :UInt32;
    bits       @4 :UInt32;
    nonce      @5 :UInt32;
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

struct Utxo {
    output   @0 :TxOut;
    height   @1 :UInt32;
    coinbase @2 :Bool;
}

struct ChainStatus {
    blocks               @0 :UInt32;
    headers              @1 :UInt32;
    chainwork            @2 :Data;
    initialBlockDownload @3 :Bool;

    background :union {
        none @4 :Void;
        info @5 :BackgroundValidation;
    }
}

struct BackgroundValidation {
    blocks    @0 :UInt32;
    headers   @1 :UInt32;
    chainwork @2 :Data;
}

struct ChainInfo {
    name @0 :Text;  # "main", "test", "testnet4", "signet", "regtest"

    signetChallenge :union {
        none      @1 :Void;
        challenge @2 :Data;
    }
}
