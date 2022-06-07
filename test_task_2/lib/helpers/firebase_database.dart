import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseMethods{

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("info").add(userMap);
  }

}