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
  }) {
    // Function body added
  }
}
