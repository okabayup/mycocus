import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrumRecord extends FirestoreRecord {
  DrumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tanggalProduksi" field.
  DateTime? _tanggalProduksi;
  DateTime? get tanggalProduksi => _tanggalProduksi;
  bool hasTanggalProduksi() => _tanggalProduksi != null;

  // "versi" field.
  String? _versi;
  String get versi => _versi ?? '';
  bool hasVersi() => _versi != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "serialNumber" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  bool hasSerialNumber() => _serialNumber != null;

  void _initializeFields() {
    _tanggalProduksi = snapshotData['tanggalProduksi'] as DateTime?;
    _versi = snapshotData['versi'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _serialNumber = snapshotData['serialNumber'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drum');

  static Stream<DrumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrumRecord.fromSnapshot(s));

  static Future<DrumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrumRecord.fromSnapshot(s));

  static DrumRecord fromSnapshot(DocumentSnapshot snapshot) => DrumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrumRecordData({
  DateTime? tanggalProduksi,
  String? versi,
  DocumentReference? user,
  String? serialNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tanggalProduksi': tanggalProduksi,
      'versi': versi,
      'user': user,
      'serialNumber': serialNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrumRecordDocumentEquality implements Equality<DrumRecord> {
  const DrumRecordDocumentEquality();

  @override
  bool equals(DrumRecord? e1, DrumRecord? e2) {
    return e1?.tanggalProduksi == e2?.tanggalProduksi &&
        e1?.versi == e2?.versi &&
        e1?.user == e2?.user &&
        e1?.serialNumber == e2?.serialNumber;
  }

  @override
  int hash(DrumRecord? e) => const ListEquality()
      .hash([e?.tanggalProduksi, e?.versi, e?.user, e?.serialNumber]);

  @override
  bool isValidKey(Object? o) => o is DrumRecord;
}
