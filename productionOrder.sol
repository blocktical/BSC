// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.5.10;
 
//assumptions: 
//unique id for all products is in bytes32
//user order everything at once only
//one user only one order list

//product order smart contract
contract productOrder{
 
    //declare the variables
    address defaultAdmin; //default Admin address
    struct details {
        bytes32 id; //considering unique id for all the products
        bytes32 name;
        bytes32 discription;
        uint price;
        uint availableQuantity;
        address listedBy;
        address lastModifiedBy;
    }
    mapping (bytes32 => details) productDetails; //mapping to store all the details of all the product
    struct order {
        mapping ( bytes32 => uint) _order;
        address orderBy;
        bool isOrdered;
    }
    mapping (address => order) orderList;
    
    //constructor for initialization of the smartcontract
	constructor() {
        //setting admin for the default implementation
        defaultAdmin = msg.sender;
    }
 
    //listing all the events
    event _addproduct(bytes32 indexed productID, address indexed responsiblePerson);
    event updateproduct(bytes32 indexed productID, address indexed updatedBy);
    event addToCart(bytes32 indexed productID, address indexed cartOwner);
    event placeOrderEvent(address indexed orderedBy);
    //function to list/update product on the network
    function addProduct(bytes32 id, bytes32 name, bytes32 discription, uint price, uint quantity) public {
        require(msg.sender == defaultAdmin, "Only Admin can list or update products");
        if(productDetails[id].listedBy == address(0)){
            //list the product to the product list
            productDetails[id].id = id;
            productDetails[id].name = name;
            productDetails[id].discription = discription;
            productDetails[id].price = price;
            productDetails[id].availableQuantity = quantity;
            productDetails[id].listedBy = msg.sender;
            productDetails[id].lastModifiedBy = msg.sender;
            emit _addproduct(id,msg.sender);
        }else{
            //update the existing product with the new stock added
            productDetails[id].name = name;
            productDetails[id].discription = discription;
            productDetails[id].price = price;
            productDetails[id].availableQuantity = productDetails[id].availableQuantity + quantity;
            productDetails[id].lastModifiedBy = msg.sender;
            emit updateproduct(id, msg.sender);
        }
    }
 
    //function to read product details from the product list
    function getProductDetails(bytes32 id) public view returns (bytes32 _id, bytes32 _name, bytes32 _discription, uint _price, uint _quantity) {
 
        _id = productDetails[id].id;
        _name = productDetails[id].name;
        _discription = productDetails[id].discription;
        _price = productDetails[id].price;
        _quantity = productDetails[id].availableQuantity;
        return ( _id, _name, _discription, _price, _quantity );
    }

    //function to create order for the user
    function placeToCart(bytes32 _productID, uint _quantity) public payable {
        require(productDetails[_productID].listedBy != address(0),"Order is not listed");
        require(msg.value >= productDetails[_productID].price);
        if(productDetails[_productID].availableQuantity >= _quantity){ //, "Quantity is not available as per your requirement"){
        if( orderList[msg.sender].isOrdered != true ){
            orderList[msg.sender]._order[_productID] = orderList[msg.sender]._order[_productID] + _quantity;
            orderList[msg.sender].orderBy = msg.sender;
            emit addToCart(_productID, msg.sender);
        }
        }
    }

    //Place Order: Order Complete by ordering the cart
    function placeOrder() public {
        require(orderList[msg.sender].orderBy != address(0), "There is no item in User's Cart");
        require(orderList[msg.sender].isOrdered != true, "Order is already placed");
        orderList[msg.sender].isOrdered = true;
        emit placeOrderEvent(msg.sender);
    }
}
