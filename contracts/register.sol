pragma solidity ^0.8.0;

contract DroneRegister {
    
    struct Drone {
        uint256 id;
        uint256 latitude;
        uint256 longitude;
        uint256 altitude;
        uint256 speed;
        uint256 controlStationLatitude;
        uint256 controlStationLongitude;
        uint256 controlStationAltitude;
        uint256 timestamp;
        bool emergencyStatus;
    }
    
    struct User {
        uint256 id;
        string name;
        string deliveryAddress;
        string itemDetails;
    }
    
    mapping(uint256 => Drone) public drones;
    mapping(uint256 => User) public users;
    
    uint256 public dronesCount;
    uint256 public usersCount;
    
    // Register a new drone owner
    function registerDrone(uint256 _latitude, uint256 _longitude, uint256 _altitude, uint256 _speed, 
        uint256 _controlStationLatitude, uint256 _controlStationLongitude, uint256 _controlStationAltitude, 
        bool _emergencyStatus) public {
        
        dronesCount++;
        drones[dronesCount] = Drone(dronesCount, _latitude, _longitude, _altitude, _speed, _controlStationLatitude,
            _controlStationLongitude, _controlStationAltitude, block.timestamp, _emergencyStatus);
    }
    
    // Register a new user
    function registerUser(string memory _name, string memory _deliveryAddress, string memory _itemDetails) public {
        
        usersCount++;
        users[usersCount] = User(usersCount, _name, _deliveryAddress, _itemDetails);
    }
    
    // Get drone information by ID
    function getDroneByID(uint256 _id) public view returns (uint256, uint256, uint256, uint256, uint256, 
        uint256, uint256, uint256, bool) {
        
        Drone memory drone = drones[_id];
        return (drone.latitude, drone.longitude, drone.altitude, drone.speed, drone.controlStationLatitude, 
            drone.controlStationLongitude, drone.controlStationAltitude, drone.timestamp, drone.emergencyStatus);
    }
    
    // Get user information by ID
    function getUserByID(uint256 _id) public view returns (string memory, string memory, string memory) {
        
        User memory user = users[_id];
        return (user.name, user.deliveryAddress, user.itemDetails);
    }
}
