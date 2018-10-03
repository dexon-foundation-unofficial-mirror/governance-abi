pragma solidity ^0.4.11;

contract Governance {
    // Nodes
    struct Node {
        address owner;
        bytes publicKey;
        uint256 staked;
        string name;
        string email;
        string location;
        string url;
    }

    // 0: round to blockHeight mapping.
    uint256[] public roundHeight;

    // 1: nodes.
    Node[] public nodes;

    // 2: stores the array index of nodes + 1
    mapping(address => uint256) public offset;

    // 3: CRS.
    bytes32[] public crs;

    // 4: dkgMasterPublicKeys
    bytes[][] public dkgMasterPublicKeys;

    // 5: dkgComplaints
    bytes[][] public dkgComplaints;

    // 6: dkgFinalizeds
    mapping(address => bool)[] public dkgFinalizeds;

    // 7: dkgFinalizedsCount
    uint256[] public dkgFinalizedsCount;

    // 8: owner address.
    address public owner;

    // 9: blockReward.
    uint256 public blockReward;

    // 10: blockGasLimit.
    uint256 public blockGasLimit;

    // 11: Network related.
    uint256 public numChains;

    // Lambda related.
    // 12
    uint256 public lambdaBA;
    // 13
    uint256 public lambdaDKG;

    // Total ordering related.
    // 14
    uint256 public k;
    // 15
    uint256 public phiRatio;  // stored as PhiRatio * 10^6

    // Set related.
    // 16
    uint256 public notarySetSize;
    // 17
    uint256 public dkgSetSize;

    // Time related.
    // 18
    uint256 public roundInterval;
    // 19
    uint256 public minBlockInterval;

    // ----------
    // Modifiers.
    // ----------
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // ----------
    // Events.
    // ----------
    event ConfigurationChanged();
    event CRSProposed(uint256 indexed round, bytes32 crs);

    // transferOwnership()
    function transferOwnership(address newOwner) onlyOwner {
    }

    // UpdateConfiguration(...)
    function updateConfiguration(
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

    // AddDKGFinalize(round, finalize)
    function addDKGFinalize(uint256 Round, bytes Finalize) public {
    }

    // Stake(public_key)
    function stake(bytes PublicKey, string Name, string Email,
                   string Location, string Url) public payable {
    }

    // Unstake()
    function unstake() public {
    }

    // Return number of nodes.
    function nodesLength() view public returns (uint256) {
    }
}
