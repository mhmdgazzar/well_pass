import '../features/main_screen/domain/user.dart';
import '../features/wallet/domain/body_type.dart';
import '../features/wallet/domain/connection.dart';
import '../features/wallet/domain/gender.dart';
import '../features/wallet/domain/wallet.dart';
import 'database_repository.dart';

// Database simulation
// Logged user
User user1 = User(
  userID: '1',
  password: '123',
  email: 'email',
  wallet: null,
);

// User wallet
Wallet userWallet = Wallet(
  user: user1,
  connections: [],
  walletID: '7676465MFDFG546',
  photoUrl: '',
  gender: Gender.male,
  country: 'Germany',
  city: 'Berlin',
  dateOfBirth: DateTime(1990, 01, 01),
  bodyWeight: 0,
  bodyHeight: 0,
  bodyType: BodyType.ectomorph,
  hasDiabetes: false,
  hasHypertension: false,
  hasAlzheimer: false,
  qrCode: '',
  firstName: 'Martin',
  lastName: 'Müller',
);

class MockDatabase implements DatabaseRepository {
  @override
  void attachWallet(Wallet userWallet) {
    user1.wallet = userWallet;
  }

  @override
  List<Wallet>? getUserWallets() {
    return user1.wallet != null ? [user1.wallet!] : null;
  }

  @override
  List<Connection>? getWalletConnections() {
    return userWallet.connections;
  }

  @override
  void walletCityChange(String newCity) {
    userWallet.city = newCity;
  }

  @override
  String? getWalletID() {
    return user1.wallet?.walletID;
  }
}
