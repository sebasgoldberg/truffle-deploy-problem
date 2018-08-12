pragma solidity ^0.4.24;

import "./InnerLib.sol";
import "./TestLib.sol";


contract Test {

    using TestLib for TestLib.Outer;
    
    TestLib.Outer public outer;

    constructor() public {
    }

    function addInner(string data) public{
        outer.addInner(data);
    }
    
    function addInnerInner(uint innerID, string data) public{
        outer.addInnerInner(innerID, data);
    }
    
    function getInnerData(uint ID) public view returns(string) {
        return outer.inners[ID].data;
    }

    function getInnerInnerData(uint innerID, uint ID) public view returns(string) {
        return outer.inners[innerID].innerInners[ID].data;
    }

}

