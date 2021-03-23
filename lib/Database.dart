import 'package:cloud_firestore/cloud_firestore.dart';
import 'sgpuser.dart';

class Database{

  final String uid;
  Database({this.uid});


  //collection reference
  final CollectionReference userCollection =FirebaseFirestore.instance.collection('user');

 Future updateUserData(String name,String gender,int age )async{
   return await userCollection.doc(uid).set({
     'name':name,
     'gender':gender,
     'age':age,

   });
 }

 /*
 //get user  stream
Stream<QuerySnapshot> get user{
   return userCollection.snapshots();
}
*/
 //creating a user list from snapshots
  List<sgpuser> _userlistfromsnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return sgpuser(
            name:doc.data()['name'] ?? '',
            gender:doc.data()['gender'] ??'',
            age:doc.data()['age'] ?? 0,
      );
    }).toList();
  }
//creating a new stream to get any data change in userCollection
Stream<List<sgpuser>> get user{
   return userCollection.snapshots()
       .map(_userlistfromsnapshot);
}

Stream<DocumentSnapshot> get userData{
    return userCollection.doc (uid).snapshots();
}



}