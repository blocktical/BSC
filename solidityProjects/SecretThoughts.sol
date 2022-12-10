// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

/** 
 * @title secretThoughts
 */
contract secretThoughts {
    // global public 
    uint256 public globalThoughtID;
    uint256 internal upVoteSpecialLimit;
    uint256 internal downVoteSpecialLimit;
    address internal admin;

    // constructor
    constructor(uint256 upSL, uint256 downSL){
        globalThoughtID         = 1;
        upVoteSpecialLimit      = upSL;
        downVoteSpecialLimit    = downSL;
        admin                   = msg.sender;
    }

    // create events
    event eThoughtCreated( uint256 indexed _eThoughtID, string _eThought );
    event eThoughtBlocked( uint256 indexed _eThoughtID, address _blockedBy );
    event eUpdatedSpecialLimit(uint256 _upVote, uint256 _downVote);

    // create structure for thoughts
    struct Thoughts {
        uint256 thoughtID;
        uint256 upVote;
        uint256 downVote;
        uint256 timeStamp;
        address createdBy;
        address ownedBy;
        string  thought;
        bool    specialThought;
        bool    isBlocked;
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

    // modifier for checking admin
    modifier isAdmin{
        require(msg.sender == admin, "You are not allowed to block the thoughts. Do connect with Admin.");
        _;
    }

    // reads thoughts based on thoughtId
    function readThought(uint256 _thoughtID) view virtual public returns (uint256, uint256, uint256, address, address, string memory ){
        return ( thoughtData[_thoughtID].upVote, thoughtData[_thoughtID].downVote, thoughtData[_thoughtID].timeStamp, 
                 thoughtData[_thoughtID].createdBy, thoughtData[_thoughtID].ownedBy, thoughtData[_thoughtID].thought );
    }

    // create thoughts based on user input
    function createThought(string memory _thought) virtual public {
        thoughtData[globalThoughtID].thoughtID      = globalThoughtID;
        thoughtData[globalThoughtID].upVote         = 0;
        thoughtData[globalThoughtID].downVote       = 0;
        thoughtData[globalThoughtID].timeStamp      = block.timestamp ;
        thoughtData[globalThoughtID].createdBy      = msg.sender;
        thoughtData[globalThoughtID].ownedBy        = msg.sender;
        thoughtData[globalThoughtID].thought        = _thought;
        thoughtData[globalThoughtID].specialThought = false;
        thoughtData[globalThoughtID].isBlocked      = false;
        emit eThoughtCreated(globalThoughtID, _thought);
    }

    // update thought 
    // still need to update the cost part after writing the ThoughtToken SmartContract
    function updateThought(uint256 _updateThoughtID, string memory _updatedThought) virtual public returns (string memory) {
        require(thoughtData[_updateThoughtID].ownedBy == msg.sender , "You are not authorised to update the thought");
        thoughtData[_updateThoughtID].thought = _updatedThought;
        return "Thought Updated Successfully";
    }

    // upVote the thought
    function upVoteThought(uint256 _thoughtID) virtual public {
        thoughtData[_thoughtID].upVote += 1;
        if(thoughtData[_thoughtID].upVote >= upVoteSpecialLimit){
            thoughtData[_thoughtID].specialThought = true;
        }
    }

    // downVote the thought
    function downVoteThought(uint256 _thoughtID) virtual public {
        thoughtData[_thoughtID].downVote += 1;
    }

    // block thoughts by admin
    function blockThought(uint256 _thoughtID) virtual isAdmin public {
        thoughtData[globalThoughtID].isBlocked = true;
        emit eThoughtBlocked( _thoughtID, msg.sender );
    }

    // update Special Limit
    function updateSpecialLimit(uint256 _upVoteSL, uint256 _downVoteSL) virtual isAdmin public {
        if(_upVoteSL != 0){
            upVoteSpecialLimit      = _upVoteSL;
        }
        if(_downVoteSL != 0){
            downVoteSpecialLimit    = _downVoteSL;
        }
        emit eUpdatedSpecialLimit(upVoteSpecialLimit, downVoteSpecialLimit);
    }

}
