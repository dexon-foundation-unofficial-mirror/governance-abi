pragma solidity ^0.5.0;

contract Governance {
    // Nodes.
    struct Node {
        address owner;
        bytes publicKey;
        uint256 staked;
        uint256 fined;
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

    // ReportType.
    enum ReportType {
        INVALID_DKG,
        FORK_VOTE,
        FORK_BLOCK
    }

    // 0: round to blockHeight mapping.
    uint256[] public roundHeight;

    // 1: nodes.
    Node[] public nodes;

    // 2: stores the array index + 1 of nodes by address.
    mapping(address => int256) public nodesOffsetByAddress;

    // 3: stores the array index + 1 of nodes by ID.
    mapping(bytes32 => int256) public nodesOffsetByID;

    // 4: delegators.
    mapping(address => Delegator[]) public delegators;

    // 5: stores the array index + 1 of nodes for delgators.
    mapping(address => mapping(address => int256)) public delegatorsOffset;

    // 6: CRS.
    bytes32[] public crs;

    // 7: dkgMasterPublicKeys
    bytes[][] public dkgMasterPublicKeys;

    // 8: dkgComplaints
    bytes[][] public dkgComplaints;

    // 9: dkgMPKReadys
    mapping(address => bool)[] public dkgMPKReadys;

    // 10: dkgMPKReadysCount
    uint256[] public dkgMPKReadysCount;

    // 11: dkgFinalizeds
    mapping(address => bool)[] public dkgFinalizeds;

    // 12: dkgFinalizedsCount
    uint256[] public dkgFinalizedsCount;

    // 13: owner address.
    address public owner;

    // 14: minStake
    uint256 public minStake;

    // 15: lockupPeriod
    uint256 public lockupPeriod;

    // 16: blockReward.
    uint256 public blockReward;

    // 17: blockGasLimit.
    uint256 public blockGasLimit;

    // 18: Network related.
    uint256 public numChains;

    // Lambda related.
    // 19
    uint256 public lambdaBA;
    // 20
    uint256 public lambdaDKG;

    // Total ordering related.
    // 21
    uint256 public k;
    // 22
    uint256 public phiRatio;  // stored as PhiRatio * 10^6

    // Set related.
    // 23
    uint256 public notarySetSize;
    // 24
    uint256 public dkgSetSize;

    // Time related.
    // 25
    uint256 public roundInterval;
    // 26
    uint256 public minBlockInterval;

    // 27: Fine value.
    uint256[] public fineValues;

    // 28: Fined records.
    mapping(bytes32 => bool) public finedRecords;

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
    function transferOwnership(address newOwner) public onlyOwner {
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
        uint256 MinBlockInterval,
        uint256[] memory FineValues)
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
    function proposeCRS(uint256 Round, bytes memory SignedCRS) public {
    }

    // AddDKGComplaint(round, complaint)
    function addDKGComplaint(uint256 Round, bytes memory Complaint) public {
    }

    // AddDKGMasterPublicKey(round, key)
    function addDKGMasterPublicKey(uint256 Round, bytes memory PublicKey) public {
    }

    // AddDKGMPKReady(round, ready)
    function addDKGMPKReady(uint256 Round, bytes memory MPKReady) public {
    }

    // AddDKGFinalize(round, finalize)
    function addDKGFinalize(uint256 Round, bytes memory Finalize) public {
    }

    // Stake(public_key, name, email, location, url)
    function stake(bytes memory PublicKey, string memory Name,
                   string memory Email, string memory Location,
                   string memory Url) public payable {
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

    // PayFine(node)
    function payFine(address NodeAddress) public payable {
    }

    // Report(enum type, bytes[] payloads)
    function report(uint256 Type, bytes memory Arg1, bytes memory Arg2) public {
    }
}
