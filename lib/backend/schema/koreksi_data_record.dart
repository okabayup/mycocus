import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class KoreksiDataRecord extends FirestoreRecord {
  KoreksiDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tanggal" field.
  DateTime? _tanggal;
  DateTime? get tanggal => _tanggal;
  bool hasTanggal() => _tanggal != null;

  // "namaData" field.
  String? _namaData;
  String get namaData => _namaData ?? '';
  bool hasNamaData() => _namaData != null;

  // "nilaiData" field.
  double? _nilaiData;
  double get nilaiData => _nilaiData ?? 0.0;
  bool hasNilaiData() => _nilaiData != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tanggal = snapshotData['tanggal'] as DateTime?;
    _namaData = snapshotData['namaData'] as String?;
    _nilaiData = castToType<double>(snapshotData['nilaiData']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('koreksiData')
          : FirebaseFirestore.instance.collectionGroup('koreksiData');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('koreksiData').doc();

  static Stream<KoreksiDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KoreksiDataRecord.fromSnapshot(s));

  static Future<KoreksiDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KoreksiDataRecord.fromSnapshot(s));

  static KoreksiDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KoreksiDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KoreksiDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KoreksiDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KoreksiDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KoreksiDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKoreksiDataRecordData({
  DateTime? tanggal,
  String? namaData,
  double? nilaiData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tanggal': tanggal,
      'namaData': namaData,
      'nilaiData': nilaiData,
    }.withoutNulls,
  );

  return firestoreData;
}

class KoreksiDataRecordDocumentEquality implements Equality<KoreksiDataRecord> {
  const KoreksiDataRecordDocumentEquality();

  @override
  bool equals(KoreksiDataRecord? e1, KoreksiDataRecord? e2) {
    return e1?.tanggal == e2?.tanggal &&
        e1?.namaData == e2?.namaData &&
        e1?.nilaiData == e2?.nilaiData;
  }

  @override
  int hash(KoreksiDataRecord? e) =>
      const ListEquality().hash([e?.tanggal, e?.namaData, e?.nilaiData]);

  @override
  bool isValidKey(Object? o) => o is KoreksiDataRecord;
}
