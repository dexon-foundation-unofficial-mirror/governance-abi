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
        uint256 unstaked;
        uint256 unstaked_at;
    }

    // ReportType.
    enum ReportType {
        INVALID_DKG,
        FORK_VOTE,
        FORK_BLOCK
    }

    // 0: round to blockHeight mapping.
    uint256[] public roundHeight;

    // 1: totalSupply
    uint256 public totalSupply;

    // 2: totalStaked.
    uint256 public totalStaked;

    // 3: nodes.
    Node[] public nodes;

    // 4: stores the array index + 1 of nodes by address.
    mapping(address => int256) public nodesOffsetByAddress;

    // 5: stores the array index + 1 of nodes by address represented by node key.
    mapping(address => int256) public nodesOffsetByNodeKeyAddress;

    // 6: crsRound.
    uint256 public crsRound;

    // 7: crs.
    bytes32 public crs;

    // 8: dkgRound.
    uint256 public dkgRound;

    // 9: dkgResetCount.
    uint256[] public dkgResetCount;

    // 10: dkgMasterPublicKeys
    bytes[] public dkgMasterPublicKeys;

    // 11: dkgComplaints
    bytes[] public dkgComplaints;

    // 12: dkgMPKReadys
    mapping(address => bool) public dkgMPKReadys;

    // 13: dkgMPKReadysCount
    uint256 public dkgMPKReadysCount;

    // 14: dkgFinalizeds
    mapping(address => bool) public dkgFinalizeds;

    // 15: dkgFinalizedsCount
    uint256 public dkgFinalizedsCount;

    // 16: owner address.
    address public owner;

    // 17: minStake
    uint256 public minStake;

    // 18: lockupPeriod
    uint256 public lockupPeriod;

    // 19: miningVelocity.
    uint256 public miningVelocity;  // stored as miningVelocity * 10^8

    // 20: nextHalvingSupply.
    uint256 public nextHalvingSupply;

    // 21: lastHalvedAmount.
    uint256 public lastHalvedAmount;

    // 22: min gas price.
    uint256 public minGasPrice;

    // 23: blockGasLimit.
    uint256 public blockGasLimit;

    // Lambda related.
    // 24
    uint256 public lambdaBA;
    // 25
    uint256 public lambdaDKG;

    // Set related.
    // 26
    uint256 public notarySetSize;
    // 27
    uint256 public dkgSetSize;

    // 28: roundLength.
    uint256 public roundLength;

    // 29: minBlockInterval.
    uint256 public minBlockInterval;

    // 30: Fine value.
    uint256[] public fineValues;

    // 31: Fined records.
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
    event Staked(address indexed NodeAddress, uint256 Amount);
    event Unstaked(address indexed NodeAddress, uint256 Amount);
    event Withdrawn(address indexed NodeAddress, uint256 Amount);
    event NodeAdded(address indexed NodeAddress);
    event NodeRemoved(address indexed NodeAddress);
    event ForkReported(address indexed NodeAddress, uint256 Type, bytes Arg1, bytes Arg2);
    event Fined(address indexed NodeAddress, uint256 Amount);
    event FinePaid(address indexed NodeAddress, uint256 Amount);
    event DKGReset(uint256 indexed Round, uint256 BlockHeight);

    // transferOwnership(newOwner)
    function transferOwnership(address NewOwner) public onlyOwner {
    }

    // UpdateConfiguration(...)
    function updateConfiguration(
        uint256 MinStake,
        uint256 LockupPeriod,
        uint256 MinGasPrice,
        uint256 BlockGasLimit,
        uint256 LambdaBA,
        uint256 LambdaDKG,
        uint256 NotarySetSize,
        uint256 DKGSetSize,
        uint256 RoundLength,
        uint256 MinBlockInterval,
        uint256[] memory FineValues)
        public onlyOwner {
    }

    // transferNodeOwnership(newOwner)
    function transferNodeOwnership(address NewOwner) public {
    }

    // Return number of nodes.
    function nodesLength() view public returns (uint256) {
    }

    // ProposeCRS(round, signedCRS)
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

    // Register(public_key, name, email, location, url)
    function register(bytes memory PublicKey, string memory Name,
                      string memory Email, string memory Location,
                      string memory Url) public payable {
    }

    // Stake()
    function stake() public payable {
    }

    // Unstake()
    function unstake(uint256 Amount) public {
    }

    // Withdraw()
    function withdraw() public {
    }

    // PayFine(node)
    function payFine(address NodeAddress) public payable {
    }

    // Report(enum type, bytes[] payloads)
    function report(uint256 Type, bytes memory Arg1, bytes memory Arg2) public {
    }

    // ResetDKG(newSignedCRS)
    function resetDKG(bytes memory NewSignedCRS) public {
    }
}
