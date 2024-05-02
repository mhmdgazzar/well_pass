import '../../home/domain/user.dart';
import 'provider.dart';
import 'wallet.dart';

class Connection {
  String connectionID;
  String connectionTitle;
  User userID;
  Provider providerID;
  Wallet walletID;
  bool isActive;
  DateTime dateCreated;
  bool initiatedByUser;

  Connection({
    required this.connectionID,
    required this.connectionTitle,
    required this.userID,
    required this.providerID,
    required this.walletID,
    required this.isActive,
    required this.dateCreated,
    required this.initiatedByUser,
  }) {
    // Function body added
  }
}
