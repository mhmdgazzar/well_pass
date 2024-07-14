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

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'password': password,
      'email': email,
      'wallet': wallet!.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userID: map['userID'],
      password: map['password'],
      email: map['email'],
      wallet: Wallet.fromMap(map['wallet']),
    );
  }
}
