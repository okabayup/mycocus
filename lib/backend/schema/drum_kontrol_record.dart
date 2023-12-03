import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrumKontrolRecord extends FirestoreRecord {
  DrumKontrolRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tanggal" field.
  DateTime? _tanggal;
  DateTime? get tanggal => _tanggal;
  bool hasTanggal() => _tanggal != null;

  // "namaKontrol" field.
  String? _namaKontrol;
  String get namaKontrol => _namaKontrol ?? '';
  bool hasNamaKontrol() => _namaKontrol != null;

  // "nilai" field.
  int? _nilai;
  int get nilai => _nilai ?? 0;
  bool hasNilai() => _nilai != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tanggal = snapshotData['tanggal'] as DateTime?;
    _namaKontrol = snapshotData['namaKontrol'] as String?;
    _nilai = castToType<int>(snapshotData['nilai']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('drumKontrol')
          : FirebaseFirestore.instance.collectionGroup('drumKontrol');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('drumKontrol').doc();

  static Stream<DrumKontrolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrumKontrolRecord.fromSnapshot(s));

  static Future<DrumKontrolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrumKontrolRecord.fromSnapshot(s));

  static DrumKontrolRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrumKontrolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrumKontrolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrumKontrolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrumKontrolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrumKontrolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrumKontrolRecordData({
  DateTime? tanggal,
  String? namaKontrol,
  int? nilai,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tanggal': tanggal,
      'namaKontrol': namaKontrol,
      'nilai': nilai,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrumKontrolRecordDocumentEquality implements Equality<DrumKontrolRecord> {
  const DrumKontrolRecordDocumentEquality();

  @override
  bool equals(DrumKontrolRecord? e1, DrumKontrolRecord? e2) {
    return e1?.tanggal == e2?.tanggal &&
        e1?.namaKontrol == e2?.namaKontrol &&
        e1?.nilai == e2?.nilai;
  }

  @override
  int hash(DrumKontrolRecord? e) =>
      const ListEquality().hash([e?.tanggal, e?.namaKontrol, e?.nilai]);

  @override
  bool isValidKey(Object? o) => o is DrumKontrolRecord;
}
