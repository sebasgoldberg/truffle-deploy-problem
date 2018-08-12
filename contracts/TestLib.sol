pragma solidity ^0.4.24;

import "./InnerLib.sol";

library TestLib {

    struct Outer {
        string data;
        InnerLib.Inner[] inners;
        }   

    using TestLib for Outer;
    using InnerLib for InnerLib.Inner;

    function addInner(Outer storage self, string data) public{
        uint ID = self.inners.length;
        self.inners.length++;
        InnerLib.Inner storage inner = self.inners[ID];
        inner.data = data;
        self.insideTest();
    }

    function addInnerInner(Outer storage self, uint innerID, string data) public{
        InnerLib.Inner storage inner = self.inners[innerID];
        inner.addInnerInner(self, data);
    }
    
    function insideTest(Outer storage self) internal view{
        string data = self.data;
    }

}

