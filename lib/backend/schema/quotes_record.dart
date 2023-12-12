import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuotesRecord extends FirestoreRecord {
  QuotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Filter1" field.
  String? _filter1;
  String get filter1 => _filter1 ?? '';
  bool hasFilter1() => _filter1 != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "author_jpn" field.
  String? _authorJpn;
  String get authorJpn => _authorJpn ?? '';
  bool hasAuthorJpn() => _authorJpn != null;

  // "author_kor" field.
  String? _authorKor;
  String get authorKor => _authorKor ?? '';
  bool hasAuthorKor() => _authorKor != null;

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  // "quote_jpn" field.
  String? _quoteJpn;
  String get quoteJpn => _quoteJpn ?? '';
  bool hasQuoteJpn() => _quoteJpn != null;

  // "quote_kor" field.
  String? _quoteKor;
  String get quoteKor => _quoteKor ?? '';
  bool hasQuoteKor() => _quoteKor != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _filter1 = snapshotData['Filter1'] as String?;
    _type = snapshotData['Type'] as String?;
    _author = snapshotData['author'] as String?;
    _authorJpn = snapshotData['author_jpn'] as String?;
    _authorKor = snapshotData['author_kor'] as String?;
    _quote = snapshotData['quote'] as String?;
    _quoteJpn = snapshotData['quote_jpn'] as String?;
    _quoteKor = snapshotData['quote_kor'] as String?;
    _uid = snapshotData['UID'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quotes');

  static Stream<QuotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuotesRecord.fromSnapshot(s));

  static Future<QuotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuotesRecord.fromSnapshot(s));

  static QuotesRecord fromSnapshot(DocumentSnapshot snapshot) => QuotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuotesRecordData({
  String? filter1,
  String? type,
  String? author,
  String? authorJpn,
  String? authorKor,
  String? quote,
  String? quoteJpn,
  String? quoteKor,
  String? uid,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Filter1': filter1,
      'Type': type,
      'author': author,
      'author_jpn': authorJpn,
      'author_kor': authorKor,
      'quote': quote,
      'quote_jpn': quoteJpn,
      'quote_kor': quoteKor,
      'UID': uid,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuotesRecordDocumentEquality implements Equality<QuotesRecord> {
  const QuotesRecordDocumentEquality();

  @override
  bool equals(QuotesRecord? e1, QuotesRecord? e2) {
    return e1?.filter1 == e2?.filter1 &&
        e1?.type == e2?.type &&
        e1?.author == e2?.author &&
        e1?.authorJpn == e2?.authorJpn &&
        e1?.authorKor == e2?.authorKor &&
        e1?.quote == e2?.quote &&
        e1?.quoteJpn == e2?.quoteJpn &&
        e1?.quoteKor == e2?.quoteKor &&
        e1?.uid == e2?.uid &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(QuotesRecord? e) => const ListEquality().hash([
        e?.filter1,
        e?.type,
        e?.author,
        e?.authorJpn,
        e?.authorKor,
        e?.quote,
        e?.quoteJpn,
        e?.quoteKor,
        e?.uid,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is QuotesRecord;
}
