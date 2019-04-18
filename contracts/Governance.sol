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
        uint256 unstakedAt;
    }

    // ReportType.
    enum ReportType {
        FAIL_STOP,
        FAIL_STOP_DKG,
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

    // 6: last proposed blockheight.
    mapping(address => uint256) public lastProposedHeight;

    // 7: crsRound.
    uint256 public crsRound;

    // 8: crs.
    bytes32 public crs;

    // 9: dkgRound.
    uint256 public dkgRound;

    // 10: dkgResetCount.
    uint256[] public dkgResetCount;

    // 11: dkgMasterPublicKeys
    bytes[] public dkgMasterPublicKeys;

    // 12: dkgMasterPublicKeyOffset
    mapping(bytes32 => uint256) public dkgMasterPublicKeyOffset;

    // 13: dkgComplaints
    bytes[] public dkgComplaints;

    // 14: dkgComplaintsProposed
    mapping(bytes32 => bool) public dkgComplaintsProposed;

    // 15: dkgMPKReadys
    mapping(address => bool) public dkgMPKReadys;

    // 16: dkgMPKReadysCount
    uint256 public dkgMPKReadysCount;

    // 17: dkgFinalizeds
    mapping(address => bool) public dkgFinalizeds;

    // 18: dkgFinalizedsCount
    uint256 public dkgFinalizedsCount;

    // 19: dkgSuccesses
    mapping(address => bool) public dkgSuccesses;

    // 20: dkgSuccessesCount
    uint256 public dkgSuccessesCount;

    // 21: owner address.
    address public owner;

    // 22: minStake
    uint256 public minStake;

    // 23: lockupPeriod
    uint256 public lockupPeriod;

    // 24: miningVelocity.
    uint256 public miningVelocity;  // stored as miningVelocity * 10^8

    // 25: nextHalvingSupply.
    uint256 public nextHalvingSupply;

    // 26: lastHalvedAmount.
    uint256 public lastHalvedAmount;

    // 27: min gas price.
    uint256 public minGasPrice;

    // 28: blockGasLimit.
    uint256 public blockGasLimit;

    // Lambda related.
    // 29: BA.
    uint256 public lambdaBA;
    // 30: DKG.
    uint256 public lambdaDKG;

    // Set related.
    // 31: notary set size
    uint256 public notarySetSize;

    // 32: notary set parameter: alpha.
    uint256 public notaryParamAlpha;  // stored as notaryParamAlpha * 10^8

    // 33: notary set parameter: beta.
    uint256 public notaryParamBeta;  // stored as notaryParamBeta * 10^8

    // 34: roundLength.
    uint256 public roundLength;

    // 35: minBlockInterval.
    uint256 public minBlockInterval;

    // 36: Fine value.
    uint256[] public fineValues;

    // 37: Fined records.
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
    event NodeOwnershipTransfered(address indexed NodeAddress, address indexed NewOwnerAddress);
    event NodePublicKeyReplaced(address indexed NodeAddress, bytes PublicKey);
    event Staked(address indexed NodeAddress, uint256 Amount);
    event Unstaked(address indexed NodeAddress, uint256 Amount);
    event Withdrawn(address indexed NodeAddress, uint256 Amount);
    event NodeAdded(address indexed NodeAddress);
    event NodeRemoved(address indexed NodeAddress);
    event Reported(address indexed NodeAddress, uint256 Type, bytes Arg1, bytes Arg2);
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
        uint256 NotaryParamAlpha,
        uint256 NotaryParamBeta,
        uint256 RoundLength,
        uint256 MinBlockInterval,
        uint256[] memory FineValues)
        public onlyOwner {
    }

    // transferNodeOwnership(newOwner)
    function transferNodeOwnership(address NewOwner) public {
    }

    // replaceNodePublicKey(newPublicKey)
    function replaceNodePublicKey(bytes memory NewPublicKey) public {
    }

    // Return number of nodes.
    function nodesLength() view public returns (uint256) {
    }

    // ProposeCRS(round, signedCRS)
    function proposeCRS(uint256 Round, bytes memory SignedCRS) public {
    }

    // AddDKGComplaint(complaint)
    function addDKGComplaint(bytes memory Complaint) public {
    }

    // AddDKGMasterPublicKey(key)
    function addDKGMasterPublicKey(bytes memory PublicKey) public {
    }

    // AddDKGMPKReady(ready)
    function addDKGMPKReady(bytes memory MPKReady) public {
    }

    // AddDKGFinalize(finalize)
    function addDKGFinalize(bytes memory Finalize) public {
    }

    // AddDKGSuccess(success)
    function addDKGSuccess(bytes memory Success) public {
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

    // Withdrawable()
    function withdrawable() public view returns (bool) {
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
