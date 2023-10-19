import 'package:cloud_firestore/cloud_firestore.dart';

class ApiFunctions {
  static var apiKey = '';
  ApiFunctions();

  Map<String, String> convertDocumentSnapshotToMapStringString(
      DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data();
    if (data == null) {
      return {};
    }

    // Cast the data to a Map<String, dynamic>.
    final map = data as Map<String, dynamic>;

    // Convert the dynamic values to strings.
    final mapStringString =
        map.map((key, value) => MapEntry(key, value.toString()));

    return mapStringString;
  }

  getKeyFromFB() async {
    await FirebaseFirestore.instance
        .collection('apiKeys')
        .doc('zse8J8HFteGR3Blimlkl')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Map<String, String> data =
          convertDocumentSnapshotToMapStringString(documentSnapshot);
      apiKey = data['key'].toString();
    });
  }
}