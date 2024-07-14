import '../../main_screen/domain/user.dart';
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
  });

  Map<String, dynamic> toMap() {
    return {
      'connectionID': connectionID,
      'connectionTitle': connectionTitle,
      'userID': userID.toMap(),
      'providerID': providerID.toMap(),
      'walletID': walletID.toMap(),
      'isActive': isActive,
      'dateCreated': dateCreated.toIso8601String(),
      'initiatedByUser': initiatedByUser,
    };
  }

  factory Connection.fromMap(Map<String, dynamic> map) {
    return Connection(
      connectionID: map['connectionID'],
      connectionTitle: map['connectionTitle'],
      userID: User.fromMap(map['userID']),
      providerID: Provider.fromMap(map['providerID']),
      walletID: Wallet.fromMap(map['walletID']),
      isActive: map['isActive'],
      dateCreated: DateTime.parse(map['dateCreated']),
      initiatedByUser: map['initiatedByUser'],
    );
  }
}
