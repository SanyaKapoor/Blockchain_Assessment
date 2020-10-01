pragma solidity 0.5.16;

contract Tshirt {
    struct order{
        uint id;
        uint qty;
        uint cost;
        bool accept;
        bool complete;
        bool payment;
    }
    order []orders;
    
    address public beachTshirts = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public threadsInc = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    //restrict to beach t shirts
    function addOrder (uint id, uint qty) public {
        require(msg.sender == beachTshirts);
        order memory o =order(id, qty, 0, false, false, false);
	    orders.push(o); 
    }
    function makePayment (uint id) public {
        require(msg.sender == beachTshirts);
    uint i; 
	for(i=0;i<orders.length;i++) 
	{ 
		order memory o=orders[i]; 
		if(o.id==id) 
		{ 
				o.payment = true; 
				orders[i] = o;
		} 
	} 
    }
    
    function getOrder(uint id) public view returns( uint,uint,uint,bool,bool,bool)
    { 
	uint i; 
	for(i=0;i<orders.length;i++) 
	{ 
		order memory o=orders[i]; 
		if(o.id==id) 
		{ 
				return(o.id,o.qty,o.cost,o.accept,o.complete, o.payment); 
		} 
	} 
	return(0,0,0,false,false,false); 
}
    
    //restrict to Threads Inc    
    function acceptOrder (uint id) public {
        require(msg.sender == threadsInc);
    uint i; 
	for(i=0;i<orders.length;i++) 
	{ 
		order memory o=orders[i]; 
		if(o.id==id) 
		{ 
				o.accept = true; 
				orders[i] = o;
		} 
	} 
    }
    function confirmCompletion (uint id) public {
        require(msg.sender == threadsInc);
    uint i; 
	for(i=0;i<orders.length;i++) 
	{ 
		order memory o=orders[i]; 
		if(o.id==id) 
		{ 
				o.complete = true; 
				orders[i] = o;
		} 
	} 
    }
    function shareCost (uint id, uint c)public{
        require(msg.sender == threadsInc);
    uint i; 
	for(i=0;i<orders.length;i++) 
	{ 
		order memory o=orders[i]; 
		if(o.id==id) 
		{ 
				o.cost = c; 
				orders[i] = o;
		} 
	} 
    }
}


    
