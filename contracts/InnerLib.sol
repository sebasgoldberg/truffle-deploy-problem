pragma solidity ^0.4.24;

import "./TestLib.sol";

library InnerLib{
    
    using TestLib for TestLib.Outer;

    struct InnerInner{
        string data;
        mapping(address => uint) balances;
    }

    struct Inner{
        string data;
        InnerInner[] innerInners;
        mapping(address => uint) balances;
    }

    function addInnerInner(Inner storage self, TestLib.Outer storage outer, string data) public{
        uint ID = self.innerInners.length;
        self.innerInners.length++;
        InnerInner storage innerInner = self.innerInners[ID];
        innerInner.data = data;
        outer.addInner(data);
    }
    
}

