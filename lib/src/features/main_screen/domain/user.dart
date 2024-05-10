import '../../wallet/domain/wallet.dart';

class User {
  String userID;
  String password;
  String email;
  Wallet? wallet;

  User({
    required this.userID,
    required this.password,
    required this.email,
    required this.wallet,
  });
}
