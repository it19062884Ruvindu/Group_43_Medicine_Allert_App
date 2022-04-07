import 'package:cloud_firestore/cloud_firestore.dart';

class reminderService {

  final CollectionReference channels = FirebaseFirestore.instance.collection('channels');

  Future getChannelById(String id) async {
    print("Get channelby id works");
    try {
      DocumentSnapshot<Object?> snapshot = await channels.doc(id).get();
      // print(snapshot.data().toString());
      return snapshot.data().toString();
    }
    catch(err) {
      print(err.toString());
    }
  }
}