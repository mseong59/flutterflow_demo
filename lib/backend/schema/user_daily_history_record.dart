import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserDailyHistoryRecord extends FirestoreRecord {
  UserDailyHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "mood" field.
  DocumentReference? _mood;
  DocumentReference? get mood => _mood;
  bool hasMood() => _mood != null;

  void _initializeFields() {
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _mood = snapshotData['mood'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userDailyHistory');

  static Stream<UserDailyHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDailyHistoryRecord.fromSnapshot(s));

  static Future<UserDailyHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserDailyHistoryRecord.fromSnapshot(s));

  static UserDailyHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDailyHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDailyHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDailyHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDailyHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDailyHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDailyHistoryRecordData({
  DateTime? createdDate,
  DocumentReference? userID,
  DocumentReference? mood,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdDate': createdDate,
      'userID': userID,
      'mood': mood,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDailyHistoryRecordDocumentEquality
    implements Equality<UserDailyHistoryRecord> {
  const UserDailyHistoryRecordDocumentEquality();

  @override
  bool equals(UserDailyHistoryRecord? e1, UserDailyHistoryRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.userID == e2?.userID &&
        e1?.mood == e2?.mood;
  }

  @override
  int hash(UserDailyHistoryRecord? e) =>
      const ListEquality().hash([e?.createdDate, e?.userID, e?.mood]);

  @override
  bool isValidKey(Object? o) => o is UserDailyHistoryRecord;
}
