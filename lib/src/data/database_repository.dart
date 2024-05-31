import '../features/wallet/domain/connection.dart';
import '../features/wallet/domain/wallet.dart';

abstract class DatabaseRepository {
  // Attach Wallet
  void attachWallet(Wallet userWallat);

  // Get user Wallets
  Future<List<Wallet>?> getUserWallets();

  // Get wallet Connections
  Future<List<Connection>?> getWalletConnections();

  // Wallet Attributes change
  void walletCityChange(String newCity);

  // WalletID
  Future<String?> getWalletID();
}
