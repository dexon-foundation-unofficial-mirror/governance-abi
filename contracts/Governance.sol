pragma solidity ^0.4.11;

contract Governance {
    // Nodes.
    struct Node {
        address owner;
        bytes publicKey;
        uint256 staked;
        string name;
        string email;
        string location;
        string url;
        bool unstaked;
    }

    // Delegator.
    struct Delegator {
        address owner;
        uint256 value;
        uint256 undelegated_at;
    }

    // 0: round to blockHeight mapping.
    uint256[] public roundHeight;

    // 1: nodes.
    Node[] public nodes;

    // 2: stores the array index of nodes + 1.
    mapping(address => int256) public nodesOffset;

    // 3: delegators.
    mapping(address => Delegator[]) public delegators;

    // 4: stores the array index of nodes + 1 for delgators.
    mapping(address => mapping(address => int256)) public delegatorsOffset;

    // 5: CRS.
    bytes32[] public crs;

    // 6: dkgMasterPublicKeys
    bytes[][] public dkgMasterPublicKeys;

    // 7: dkgComplaints
    bytes[][] public dkgComplaints;

    // 8: dkgMPKReadys
    mapping(address => bool)[] public dkgMPKReadys;

    // 9: dkgMPKReadysCount
    uint256[] public dkgMPKReadysCount;

    // 10: dkgFinalizeds
    mapping(address => bool)[] public dkgFinalizeds;

    // 11: dkgFinalizedsCount
    uint256[] public dkgFinalizedsCount;

    // 12: owner address.
    address public owner;

    // 13: minStake
    uint256 public minStake;

    // 14: lockupPeriod
    uint256 public lockupPeriod;

    // 15: blockReward.
    uint256 public blockReward;

    // 16: blockGasLimit.
    uint256 public blockGasLimit;

    // 17: Network related.
    uint256 public numChains;

    // Lambda related.
    // 18
    uint256 public lambdaBA;
    // 19
    uint256 public lambdaDKG;

    // Total ordering related.
    // 20
    uint256 public k;
    // 21
    uint256 public phiRatio;  // stored as PhiRatio * 10^6

    // Set related.
    // 22
    uint256 public notarySetSize;
    // 23
    uint256 public dkgSetSize;

    // Time related.
    // 24
    uint256 public roundInterval;
    // 25
    uint256 public minBlockInterval;

    // ----------
    // Modifiers.
    // ----------
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // -------
    // Events.
    // -------
    event ConfigurationChanged();
    event CRSProposed(uint256 indexed Round, bytes32 CRS);
    event Staked(address indexed NodeAddress);
    event Unstaked(address indexed NodeAddress);
    event Delegated(address indexed NodeAddress, address indexed DelegatorAddress, uint256 Amount);
    event Undelegated(address indexed NodeAddress, address indexed DelegatorAddress);

    // transferOwnership()
    function transferOwnership(address newOwner) onlyOwner {
    }

    // UpdateConfiguration(...)
    function updateConfiguration(
        uint256 MinStake,
        uint256 LockupPeriod,
        uint256 BlockReward,
        uint256 BlockGasLimit,
        uint256 NumChains,
        uint256 LambdaBA,
        uint256 LambdaDKG,
        uint256 K,
        uint256 PhiRatio,
        uint256 NotarySetSize,
        uint256 DKGSetSize,
        uint256 RoundInterval,
        uint256 MinBlockInterval)
        public onlyOwner {
    }

    // Return number of nodes.
    function nodesLength() view public returns (uint256) {
    }

    // Return number of delegators for a given  node.
    function delegatorsLength(address NodeAddress) view public returns (uint256) {
    }

    // SnapshotRound(round, height)
    function snapshotRound(uint256 Round, uint256 Height) public {
    }

    // ProposeCRS(signedCRS)
    function proposeCRS(uint256 Round, bytes SignedCRS) public {
    }

    // AddDKGComplaint(round, complaint)
    function addDKGComplaint(uint256 Round, bytes Complaint) public {
    }

    // AddDKGMasterPublicKey(round, key)
    function addDKGMasterPublicKey(uint256 Round, bytes PublicKey) public {
    }

    // AddDKGMPKReady(round, ready)
    function addDKGMPKReady(uint256 Round, bytes MPKReady) public {
    }

    // AddDKGFinalize(round, finalize)
    function addDKGFinalize(uint256 Round, bytes Finalize) public {
    }

    // Stake(public_key, name, email, location, url)
    function stake(bytes PublicKey, string Name, string Email,
                   string Location, string Url) public payable {
    }

    // Unstake()
    function unstake() public {
    }

    // Delegate(node)
    function delegate(address NodeAddress) public payable {
    }

    // Undelegate(node)
    function undelegate(address NodeAddress) public {
    }

    // Withdraw(node)
    function withdraw(address NodeAddress) public {
    }
}
