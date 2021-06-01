pragma solidity 0.8.0;

contract Controller{
    
    struct Database{
        string Name;
        uint Age;
        
    }
    
    uint256 DataCounter;
    mapping(address => Database) userStructs;
    mapping(address => bool)  private admins;
    mapping(address => bool)  private users;

    
    event NewAdmin(address from, address newAdmin,uint256 timestamp);
    event NewUser(address newUser,uint256 timestamp);
    
    
    modifier onlyAdmin() {
        require(admins[msg.sender],"Only Admin can access");
        _;
    }
    
    modifier onlyUsers() {
        require(admins[msg.sender],"Only Users can access");
        _;
    }
    
    
    function registerDatabase() public {
        DataCounter++;
        Database memory databases;
      
        emit registerDatabase(DataCounter, msg.sender, block.timestamp);
    }
    
    
    function registerAsUser() public {
        require(
            !admins[msg.sender],
            "Admin cannot be a user"
        );
        users[msg.sender] = true;
        emit NewUser(msg.sender, block.timestamp);
    }
    
    function insertUser(address userAddress, uint userAge) public
 returns(bool success)
{
 
 return true;
}
        

}


contract Storage is Controller{
    
    function setUser() public {
        _isUser[msg.sender] = true;
        emit NewUser(msg.sender, _isUser[msg.sender]);
    }
    
    
}
