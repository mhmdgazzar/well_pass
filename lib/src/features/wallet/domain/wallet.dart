import '../../main_screen/domain/user.dart';
import 'body_type.dart';
import 'connection.dart';
import 'gender.dart';

class Wallet {
  User user;
  List<Connection>? connections;
  String? firstName;
  String? lastName;
  final String? walletID;
  String? photoUrl;
  Gender? gender;
  String? country;
  String? city;
  DateTime? dateOfBirth;
  num? bodyWeight;
  num? bodyHeight;
  BodyType? bodyType;
  bool? hasDiabetes;
  bool? hasHypertension;
  bool? hasAlzheimer;
  String? qrCode;

  Wallet({
    required this.user,
    required this.connections,
    required this.walletID,
    required this.photoUrl,
    required this.gender,
    required this.country,
    required this.city,
    required this.dateOfBirth,
    required this.bodyWeight,
    required this.bodyHeight,
    required this.bodyType,
    required this.hasDiabetes,
    required this.hasHypertension,
    required this.hasAlzheimer,
    required this.qrCode,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'connections': connections!.map((x) => x.toMap()).toList(),
      'walletID': walletID,
      'photoUrl': photoUrl,
      'gender': gender!.index,
      'country': country,
      'city': city,
      'dateOfBirth': dateOfBirth,
      'bodyWeight': bodyWeight,
      'bodyHeight': bodyHeight,
      'bodyType': bodyType!.index,
      'hasDiabetes': hasDiabetes,
      'hasHypertension': hasHypertension,
      'hasAlzheimer': hasAlzheimer,
      'qrCode': qrCode,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      user: User.fromMap(map['user']),
      connections: List<Connection>.from(
          map['connections']?.map((x) => Connection.fromMap(x))),
      walletID: map['walletID'],
      photoUrl: map['photoUrl'],
      gender: Gender.values[map['gender']!],
      country: map['country'],
      city: map['city'],
      dateOfBirth: map['dateOfBirth'],
      bodyWeight: map['bodyWeight'],
      bodyHeight: map['bodyHeight'],
      bodyType: BodyType.values[map['bodyType']!],
      hasDiabetes: map['hasDiabetes'],
      hasHypertension: map['hasHypertension'],
      hasAlzheimer: map['hasAlzheimer'],
      qrCode: map['qrCode'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }
}
