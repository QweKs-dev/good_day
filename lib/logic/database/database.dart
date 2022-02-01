import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:good_day/logic/massege_item.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final box = GetStorage('MyStorage');
  var docCollectionRef =
      FirebaseFirestore.instance.collection('MotivationalTexts');

  var firestoreDocumentsId = [];
  var listUsedDocId = [];
  var listOfTime = [];

  final massageItem = MassageItem(
      massageText: 'Надеюсь это заработает', dateTime: DateTime.now());
  final CollectionReference motivationalTextCollection =
      FirebaseFirestore.instance.collection('MotivationalTexts');
  final motivationalTextSnapshot =
      FirebaseFirestore.instance.collection('MotivationalTexts').snapshots();

  Future<void> addMassage() async {
    return motivationalTextCollection
        .add({
          'text': massageItem.massageText,
          'time': massageItem.dateTime.toString()
        })
        .then((DocumentReference document) => print(document.id))
        .catchError((onError) => print('что то сломалось'));
  }

  Future<String> getDocId(DateTime dateTime) async {
    box.writeIfNull('listUsedDocId', listUsedDocId);
    box.writeIfNull('listOfTime', listOfTime);
    listUsedDocId = box.read('listUsedDocId');
    listOfTime = box.read('listOfTime');
    final docsId = await (await FirebaseFirestore.instance
            .collection('MotivationalTexts')
            .get())
        .docs;
    firestoreDocumentsId = await docsId.map((doc) => doc.id).toList()
      ..shuffle();
    print(firestoreDocumentsId.toString());
    print('============');
    print(listUsedDocId.toString());
    if (listUsedDocId.length >= firestoreDocumentsId.length) listUsedDocId = [];
    firestoreDocumentsId
        .removeWhere((element) => listUsedDocId.contains(element));
    listUsedDocId.add(firestoreDocumentsId.first);
    box.write(
      'listUsedDocId',
      listUsedDocId,
    );
    listOfTime.add(DateFormat.yMMMMd().add_Hm().format(dateTime).toString());
    box.write(
      'listOfTime',
      listOfTime,
    );
    print(
        'time of add === ${DateFormat.yMMMMd('en_ISO').add_Hm().format(dateTime).toString()}');
    print('add this ID ${firestoreDocumentsId.first.toString()}');
    return firestoreDocumentsId.first;
  }

  // Future<void> getDocumentId() async {
  //   final dataList = motivationalTextSnapshot.
  //   print('Получаю какой то айди ${document.id.toString()}');
  // }
}
