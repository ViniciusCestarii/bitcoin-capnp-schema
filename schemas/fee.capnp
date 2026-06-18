@0xd15c0b3e6d4f211b;

interface Fee {
    estimate @0 (withinBlocks :UInt32, mode :EstimateMode) -> (estimate :FeeEstimate);
    info @1 () -> (info :FeeInfo);
}

enum EstimateMode {
    economical   @0;
    conservative @1;
}

struct FeeEstimate {
    union {
        feeRate     @0 :Int64;
        unavailable @1 :Void;   # not enough data
    }
}

struct FeeInfo {
    relayFee       @0 :Int64;
    incrementalFee @1 :Int64;
}
