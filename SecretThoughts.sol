// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

/** 
 * @title secretThoughts
 */
contract secretThoughts {
    // constructor
    constructor(){
        globalThoughtID = 1;
    }

    // global public thoughtID
    uint256 public globalThoughtID;

    // create events
    event eThoughtCreated( uint256 indexed _eThoughtID, string _eThought );

    // create structure for thoughts
    struct Thoughts {
        uint256 thoughtID;
        uint256 upVote;
        uint256 downVote;
        uint256 timeStamp;
        address createdBy;
        address ownedBy;
        string  thought;
    }

    // create structure for Sale thoughts
    struct onSale {
        uint256 thoughtID;
        uint256 thoughtTokensQuantity;
        bool    isSold;
    }

    // map data related to the thoughts 
    mapping( uint256 => Thoughts ) thoughtData;

    // map data related to the sale
    mapping( uint256 => onSale ) onSaleData;

    // reads thoughts based on thoughtId
    function readThought(uint256 _thoughtID) view virtual public returns (uint256, uint256, uint256, address, address, string memory ){
        return ( thoughtData[_thoughtID].upVote, thoughtData[_thoughtID].downVote, thoughtData[_thoughtID].timeStamp, 
                 thoughtData[_thoughtID].createdBy, thoughtData[_thoughtID].ownedBy, thoughtData[_thoughtID].thought );
    }

    // create thoughts based on user input
    function createThought(string memory _thought) virtual public {
        thoughtData[globalThoughtID].thoughtID = globalThoughtID;
        thoughtData[globalThoughtID].upVote = 0;
        thoughtData[globalThoughtID].downVote = 0;
        thoughtData[globalThoughtID].timeStamp = block.timestamp ;
        thoughtData[globalThoughtID].createdBy = msg.sender;
        thoughtData[globalThoughtID].ownedBy = msg.sender;
        thoughtData[globalThoughtID].thought = _thought;
        emit eThoughtCreated(globalThoughtID, _thought);
    }

}
