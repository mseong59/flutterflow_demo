import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MoodsRecord extends FirestoreRecord {
  MoodsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "moodId" field.
  int? _moodId;
  int get moodId => _moodId ?? 0;
  bool hasMoodId() => _moodId != null;

  // "moodName" field.
  String? _moodName;
  String get moodName => _moodName ?? '';
  bool hasMoodName() => _moodName != null;

  // "moodIcon" field.
  String? _moodIcon;
  String get moodIcon => _moodIcon ?? '';
  bool hasMoodIcon() => _moodIcon != null;

  void _initializeFields() {
    _moodId = castToType<int>(snapshotData['moodId']);
    _moodName = snapshotData['moodName'] as String?;
    _moodIcon = snapshotData['moodIcon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moods');

  static Stream<MoodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodsRecord.fromSnapshot(s));

  static Future<MoodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodsRecord.fromSnapshot(s));

  static MoodsRecord fromSnapshot(DocumentSnapshot snapshot) => MoodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodsRecordData({
  int? moodId,
  String? moodName,
  String? moodIcon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'moodId': moodId,
      'moodName': moodName,
      'moodIcon': moodIcon,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodsRecordDocumentEquality implements Equality<MoodsRecord> {
  const MoodsRecordDocumentEquality();

  @override
  bool equals(MoodsRecord? e1, MoodsRecord? e2) {
    return e1?.moodId == e2?.moodId &&
        e1?.moodName == e2?.moodName &&
        e1?.moodIcon == e2?.moodIcon;
  }

  @override
  int hash(MoodsRecord? e) =>
      const ListEquality().hash([e?.moodId, e?.moodName, e?.moodIcon]);

  @override
  bool isValidKey(Object? o) => o is MoodsRecord;
}
