import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrumLogRecord extends FirestoreRecord {
  DrumLogRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "waktuLog" field.
  DateTime? _waktuLog;
  DateTime? get waktuLog => _waktuLog;
  bool hasWaktuLog() => _waktuLog != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "namaLog" field.
  String? _namaLog;
  String get namaLog => _namaLog ?? '';
  bool hasNamaLog() => _namaLog != null;

  // "drum" field.
  DocumentReference? _drum;
  DocumentReference? get drum => _drum;
  bool hasDrum() => _drum != null;

  // "siklus" field.
  int? _siklus;
  int get siklus => _siklus ?? 0;
  bool hasSiklus() => _siklus != null;

  // "dataLog" field.
  int? _dataLog;
  int get dataLog => _dataLog ?? 0;
  bool hasDataLog() => _dataLog != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _waktuLog = snapshotData['waktuLog'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _namaLog = snapshotData['namaLog'] as String?;
    _drum = snapshotData['drum'] as DocumentReference?;
    _siklus = castToType<int>(snapshotData['siklus']);
    _dataLog = castToType<int>(snapshotData['dataLog']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('drumLog')
          : FirebaseFirestore.instance.collectionGroup('drumLog');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('drumLog').doc();

  static Stream<DrumLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrumLogRecord.fromSnapshot(s));

  static Future<DrumLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrumLogRecord.fromSnapshot(s));

  static DrumLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrumLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrumLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrumLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrumLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrumLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrumLogRecordData({
  DateTime? waktuLog,
  DocumentReference? user,
  String? namaLog,
  DocumentReference? drum,
  int? siklus,
  int? dataLog,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'waktuLog': waktuLog,
      'user': user,
      'namaLog': namaLog,
      'drum': drum,
      'siklus': siklus,
      'dataLog': dataLog,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrumLogRecordDocumentEquality implements Equality<DrumLogRecord> {
  const DrumLogRecordDocumentEquality();

  @override
  bool equals(DrumLogRecord? e1, DrumLogRecord? e2) {
    return e1?.waktuLog == e2?.waktuLog &&
        e1?.user == e2?.user &&
        e1?.namaLog == e2?.namaLog &&
        e1?.drum == e2?.drum &&
        e1?.siklus == e2?.siklus &&
        e1?.dataLog == e2?.dataLog;
  }

  @override
  int hash(DrumLogRecord? e) => const ListEquality()
      .hash([e?.waktuLog, e?.user, e?.namaLog, e?.drum, e?.siklus, e?.dataLog]);

  @override
  bool isValidKey(Object? o) => o is DrumLogRecord;
}
