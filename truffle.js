/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() {
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>')
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

// Address: 0xBF8C48A620bacc46907f9B89732D25E47A2D7Cf7
const mnemonic = process.env.MNEMONIC || "error oven problem accuse dune flip annual panther license surface undo donor";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    mainnet: {
      network_id: 1,
      gas: 4000000,
      gasPrice: 50e9,
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://mainnet.infura.io");
      },
    },
    rinkeby: {
      network_id: 3,
      gas: 4000000,
      gasPrice: 20e9,
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io");
      },
    },
    test: {
      network_id: '*',
      host: "localhost",
      port: 8545,
      gas: 4712388
    }
  },
};
