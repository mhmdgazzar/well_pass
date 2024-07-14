import 'connection.dart';
import 'countries.dart';

class Provider {
  String providerID;
  Connection connectionID;
  String providerTitle;
  String photoUrl;
  Country country;
  String city;

  Provider({
    required this.providerID,
    required this.connectionID,
    required this.providerTitle,
    required this.photoUrl,
    required this.country,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'providerID': providerID,
      'connectionID': connectionID.toMap(),
      'providerTitle': providerTitle,
      'photoUrl': photoUrl,
      'country': country.toMap(),
      'city': city,
    };
  }

  factory Provider.fromMap(Map<String, dynamic> map) {
    return Provider(
      providerID: map['providerID'],
      connectionID: Connection.fromMap(map['connectionID']),
      providerTitle: map['providerTitle'],
      photoUrl: map['photoUrl'],
      country: map['country'],
      city: map['city'],
    );
  }
}
