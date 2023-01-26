
import 'package:cloud_firestore/cloud_firestore.dart';

class PastDb{
  getData(String uid){
    return FirebaseFirestore.instance
        .collection('fallRisk')
        .where('uid', isEqualTo: uid)
        .orderBy('dateTime')
        .get();
  }
  getStrength(String uid){
    return FirebaseFirestore.instance
        .collection('strength')
        .where('uid', isEqualTo: uid)
        .orderBy('dateTime')
        .get();
  }

}