@0x888b4f7f51e691f7;

using Common = import "common.capnp";

interface Chain {
    tip @0 () -> (block :Block);
    blockByHash @1 (hash :Data) -> (block :Block, found :Bool);
    blockByHeight @2 (height :UInt32) -> (block :Block, found :Bool);

    status @3 () -> (status :ChainStatus);
    info @4 () -> (info :ChainInfo);

    transactionByTxid @5 (txid :Data) -> (transaction :Common.Transaction, found :Bool);
    utxoByOutpoint @6 (outpoint :Common.Outpoint) -> (utxo :Utxo, found :Bool);

    handleNotifications @7 (handler :ChainNotifications) -> (handle :Common.Handle);
}

interface ChainNotifications {
    blockConnected @0 (block :Block) -> ();
    blockDisconnected @1 (block :Block) -> ();
}

interface Block {
    header @0 () -> (header :Common.BlockHeader);
    raw @1 () -> (data :Data);
    height @2 () -> (height :UInt32);
    hash @3 () -> (hash :Data);
}

struct Utxo {
    output @0 :Common.TxOut;
    height @1 :UInt32;
    coinbase @2 :Bool;
}

struct ChainStatus {
    blocks @0 :UInt32;
    headers @1 :UInt32;
    chainwork @2 :Data;
    initialBlockDownload @3 :Bool;

    background :union {
        none @4 :Void;
        info @5 :BackgroundValidation;
    }
}

struct BackgroundValidation {
    blocks @0 :UInt32;
    headers @1 :UInt32;
    chainwork @2 :Data;
}

struct ChainInfo {
    name @0 :Text;  # "main", "test", "testnet4", "signet", "regtest"

    signetChallenge :union {
        none @1 :Void;
        challenge @2 :Data;
    }
}
