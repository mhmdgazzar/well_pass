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
  wallet: userWallet,
);

// User wallet
Wallet userWallet = Wallet(
  // user: user1,
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
  // Firebase: FirebaseAuth.currentUser
  @override
  Future<void> attachWallet(Wallet userWallet) async {
    user1.wallet = userWallet;
  }

  @override
  Future<List<Wallet>?> getUserWallets() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Wallet(
        // user: user1,
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
      ),
      Wallet(
        // user: user1,
        connections: [],
        walletID: '123',
        photoUrl: '',
        gender: Gender.male,
        country: 'England',
        city: ':)',
        dateOfBirth: DateTime(1990, 01, 01),
        bodyWeight: 0,
        bodyHeight: 0,
        bodyType: BodyType.ectomorph,
        hasDiabetes: false,
        hasHypertension: false,
        hasAlzheimer: false,
        qrCode: '',
        firstName: 'Gazzar',
        lastName: 'Müller',
      ),
      Wallet(
        // user: user1,
        connections: [],
        walletID: '123',
        photoUrl: '',
        gender: Gender.female,
        country: 'England',
        city: ':)',
        dateOfBirth: DateTime(1990, 01, 01),
        bodyWeight: 0,
        bodyHeight: 0,
        bodyType: BodyType.ectomorph,
        hasDiabetes: false,
        hasHypertension: false,
        hasAlzheimer: false,
        qrCode: '',
        firstName: 'Angi',
        lastName: 'Müller',
      ),
    ];
  }

  @override
  Future<List<Connection>?> getWalletConnections() async {
    await Future.delayed(const Duration(seconds: 2));
    return userWallet.connections;
  }

  @override
  Future<void> walletCityChange(String newCity) async {
    await Future.delayed(const Duration(seconds: 2));
    userWallet.city = newCity;
  }

  @override
  Future<String?> getWalletID() async {
    await Future.delayed(const Duration(seconds: 2));
    return user1.wallet?.walletID;
  }
}
