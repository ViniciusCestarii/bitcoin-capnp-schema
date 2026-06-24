@0xf30c0b3e6d4f2130;

using Common = import "common.capnp";

interface Mining {
    createBlockTemplate @0 (options :BlockTemplateOptions) -> (template :BlockTemplate);
}

interface BlockTemplate {
    header       @0 () -> (header :Common.BlockHeader);
    block        @1 () -> (data :Data);
    transactions @2 () -> (txs :List(TemplateTx));
    coinbase     @3 () -> (coinbase :Coinbase);

    submitSolution @4 (version :UInt32, timestamp :UInt32, nonce :UInt32, coinbase :Data)
                      -> (accepted :Bool);
    waitNext       @5 (options :WaitOptions) -> (template :BlockTemplate);
}

struct TemplateTx {
    txid   @0 :Data;
    fee    @1 :Int64;
    vsize  @2 :Int64;
    weight @3 :Int64;
    sigops @4 :Int64;
}

struct Coinbase {
    tx         @0 :Data;
    merklePath @1 :List(Data);
}

struct BlockTemplateOptions {
    useMempool @0 :Bool;
}

struct WaitOptions {
    timeoutMs    @0 :UInt64;
    feeThreshold @1 :Int64;
}
