@0xf2c5cfa319406aa6;

using Chain = import "chain.capnp";
using Mempool = import "mempool.capnp";
using Mining = import "mining.capnp";
using Network = import "network.capnp";
using Node = import "node.capnp";
using Storage = import "storage.capnp";

interface Init {
    makeChain @0 () -> (result :Chain.Chain);
    makeNetwork @1 () -> (result :Network.Network);
    makeStorage @2 () -> (result :Storage.Storage);
    makeNode @3 () -> (result :Node.Node);
    makeMempool @4 () -> (result :Mempool.Mempool);
    makeMining @5 () -> (result :Mining.Mining);
}
