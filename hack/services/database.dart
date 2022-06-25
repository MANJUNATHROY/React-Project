import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase{

  final CollectionReference scholarcollection =
      FirebaseFirestore.instance.collection('scholarships');

  final String uid;
  List<String> bookmarks = [];
  DataBase({required this.uid});

  Future<List<String>> getdata() async {
    await scholarcollection
        .doc(uid)
        .get()
        .then((value) => bookmarks = List.from(value.get('bookmarks')));
    return bookmarks;
  }


  Future formdatabaseservice(String heading) async {
    return await scholarcollection.doc(uid).set({
      'bookmarks': heading,
    });
  }

  Future updatedatabaseservice(String heading) async {
    return await scholarcollection.doc(uid).update({
      'bookmarks': FieldValue.arrayUnion([heading]),
    });
  }

Future deletedatabaseservice(String heading) async {
    return await scholarcollection.doc(uid).update({
      'bookmarks': FieldValue.arrayRemove([heading]),
    });
  }

}