import '../features/wallet/domain/connection.dart';
import '../features/wallet/domain/wallet.dart';

abstract class DatabaseRepository {
  // Attach Wallet
  void attachWallet(Wallet userWallat);

  // Get user Wallets
  List<Wallet>? getUserWallets();

  // Get wallet Connections
  List<Connection>? getWalletConnections();

  // Wallet Attributes change
  void walletCityChange(String newCity);

  // WalletID
  String? getWalletID();
}
