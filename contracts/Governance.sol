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

    // 6: delegators.
    mapping(address => Delegator[]) public delegators;

    // 7: stores the array index + 1 of nodes for delegators.
    mapping(address => mapping(address => int256)) public delegatorsOffset;

    // 8: CRS.
    bytes32 public crs;

    // 9: dkgMasterPublicKeys
    bytes[] public dkgMasterPublicKeys;

    // 10: dkgComplaints
    bytes[] public dkgComplaints;

    // 11: dkgMPKReadys
    mapping(address => bool) public dkgMPKReadys;

    // 12: dkgMPKReadysCount
    uint256 public dkgMPKReadysCount;

    // 13: dkgFinalizeds
    mapping(address => bool) public dkgFinalizeds;

    // 14: dkgFinalizedsCount
    uint256 public dkgFinalizedsCount;

    // 15: owner address.
    address public owner;

    // 16: minStake
    uint256 public minStake;

    // 17: lockupPeriod
    uint256 public lockupPeriod;

    // 18: miningVelocity.
    uint256 public miningVelocity;  // stored as miningVelocity * 10^8

    // 19: nextHalvingSupply.
    uint256 public nextHalvingSupply;

    // 20: lastHalvedAmount.
    uint256 public lastHalvedAmount;

    // 21: blockGasLimit.
    uint256 public blockGasLimit;

    // Lambda related.
    // 22
    uint256 public lambdaBA;
    // 23
    uint256 public lambdaDKG;

    // Set related.
    // 24
    uint256 public notarySetSize;
    // 25
    uint256 public dkgSetSize;

    // 26: roundLength.
    uint256 public roundLength;

    // 27: minBlockInterval.
    uint256 public minBlockInterval;

    // 28: Fine value.
    uint256[] public fineValues;

    // 29: Fined records.
    mapping(bytes32 => bool) public finedRecords;

    // 30: DKG reset count
    uint256[] public DKGResetCount;

    // 31: min gas price.
    uint256 public minGasPrice;

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
    event NodeRemoved(address indexed NodeAddress);
    event Delegated(address indexed NodeAddress, address indexed DelegatorAddress, uint256 Amount);
    event Undelegated(address indexed NodeAddress, address indexed DelegatorAddress, uint256 Amount);
    event Withdrawn(address indexed NodeAddress, address indexed DelegatorAddress, uint256 Amount);
    event ForkReported(address indexed NodeAddress, uint256 Type, bytes Arg1, bytes Arg2);
    event Fined(address indexed NodeAddress, uint256 Amount);
    event FinePaid(address indexed NodeAddress, uint256 Amount);
    event DKGReset(uint256 indexed Round, uint256 BlockHeight);

    // transferOwnership()
    function transferOwnership(address newOwner) public onlyOwner {
    }

    // UpdateConfiguration(...)
    function updateConfiguration(
        uint256 MinStake,
        uint256 LockupPeriod,
        uint256 MiningVelocity,
        uint256 NextHalvingSupply,
        uint256 LastHalvingAmount,
        uint256 BlockGasLimit,
        uint256 LambdaBA,
        uint256 LambdaDKG,
        uint256 NotarySetSize,
        uint256 DKGSetSize,
        uint256 RoundLength,
        uint256 MinBlockInterval,
        uint256[] memory FineValues,
        uint256 MinGasPrice)
        public onlyOwner {
    }

    // Return number of nodes.
    function nodesLength() view public returns (uint256) {
    }

    // Return number of delegators for a given  node.
    function delegatorsLength(address NodeAddress) view public returns (uint256) {
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

    // ResetDKG(newSignedCRS)
    function resetDKG(bytes memory NewSignedCRS) public {
    }
}
