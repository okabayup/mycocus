import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AIchatRecord extends FirestoreRecord {
  AIchatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pesan" field.
  String? _pesan;
  String get pesan => _pesan ?? '';
  bool hasPesan() => _pesan != null;

  // "tanggal" field.
  DateTime? _tanggal;
  DateTime? get tanggal => _tanggal;
  bool hasTanggal() => _tanggal != null;

  // "jawaban" field.
  String? _jawaban;
  String get jawaban => _jawaban ?? '';
  bool hasJawaban() => _jawaban != null;

  // "tanggalJawab" field.
  DateTime? _tanggalJawab;
  DateTime? get tanggalJawab => _tanggalJawab;
  bool hasTanggalJawab() => _tanggalJawab != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _pesan = snapshotData['pesan'] as String?;
    _tanggal = snapshotData['tanggal'] as DateTime?;
    _jawaban = snapshotData['jawaban'] as String?;
    _tanggalJawab = snapshotData['tanggalJawab'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('AIchat')
          : FirebaseFirestore.instance.collectionGroup('AIchat');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('AIchat').doc();

  static Stream<AIchatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AIchatRecord.fromSnapshot(s));

  static Future<AIchatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AIchatRecord.fromSnapshot(s));

  static AIchatRecord fromSnapshot(DocumentSnapshot snapshot) => AIchatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AIchatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AIchatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AIchatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AIchatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAIchatRecordData({
  String? pesan,
  DateTime? tanggal,
  String? jawaban,
  DateTime? tanggalJawab,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pesan': pesan,
      'tanggal': tanggal,
      'jawaban': jawaban,
      'tanggalJawab': tanggalJawab,
    }.withoutNulls,
  );

  return firestoreData;
}

class AIchatRecordDocumentEquality implements Equality<AIchatRecord> {
  const AIchatRecordDocumentEquality();

  @override
  bool equals(AIchatRecord? e1, AIchatRecord? e2) {
    return e1?.pesan == e2?.pesan &&
        e1?.tanggal == e2?.tanggal &&
        e1?.jawaban == e2?.jawaban &&
        e1?.tanggalJawab == e2?.tanggalJawab;
  }

  @override
  int hash(AIchatRecord? e) => const ListEquality()
      .hash([e?.pesan, e?.tanggal, e?.jawaban, e?.tanggalJawab]);

  @override
  bool isValidKey(Object? o) => o is AIchatRecord;
}
