import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProduksiRecord extends FirestoreRecord {
  ProduksiRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "beratTebar" field.
  double? _beratTebar;
  double get beratTebar => _beratTebar ?? 0.0;
  bool hasBeratTebar() => _beratTebar != null;

  // "ikan" field.
  String? _ikan;
  String get ikan => _ikan ?? '';
  bool hasIkan() => _ikan != null;

  // "beratPanen" field.
  double? _beratPanen;
  double get beratPanen => _beratPanen ?? 0.0;
  bool hasBeratPanen() => _beratPanen != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "tanggalPanen" field.
  DateTime? _tanggalPanen;
  DateTime? get tanggalPanen => _tanggalPanen;
  bool hasTanggalPanen() => _tanggalPanen != null;

  // "tanggalTebar" field.
  DateTime? _tanggalTebar;
  DateTime? get tanggalTebar => _tanggalTebar;
  bool hasTanggalTebar() => _tanggalTebar != null;

  // "siklus" field.
  int? _siklus;
  int get siklus => _siklus ?? 0;
  bool hasSiklus() => _siklus != null;

  // "tanggalSiklus" field.
  DateTime? _tanggalSiklus;
  DateTime? get tanggalSiklus => _tanggalSiklus;
  bool hasTanggalSiklus() => _tanggalSiklus != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _beratTebar = castToType<double>(snapshotData['beratTebar']);
    _ikan = snapshotData['ikan'] as String?;
    _beratPanen = castToType<double>(snapshotData['beratPanen']);
    _status = snapshotData['status'] as bool?;
    _tanggalPanen = snapshotData['tanggalPanen'] as DateTime?;
    _tanggalTebar = snapshotData['tanggalTebar'] as DateTime?;
    _siklus = castToType<int>(snapshotData['siklus']);
    _tanggalSiklus = snapshotData['tanggalSiklus'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('produksi')
          : FirebaseFirestore.instance.collectionGroup('produksi');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('produksi').doc();

  static Stream<ProduksiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduksiRecord.fromSnapshot(s));

  static Future<ProduksiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduksiRecord.fromSnapshot(s));

  static ProduksiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduksiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduksiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduksiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProduksiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProduksiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProduksiRecordData({
  double? beratTebar,
  String? ikan,
  double? beratPanen,
  bool? status,
  DateTime? tanggalPanen,
  DateTime? tanggalTebar,
  int? siklus,
  DateTime? tanggalSiklus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'beratTebar': beratTebar,
      'ikan': ikan,
      'beratPanen': beratPanen,
      'status': status,
      'tanggalPanen': tanggalPanen,
      'tanggalTebar': tanggalTebar,
      'siklus': siklus,
      'tanggalSiklus': tanggalSiklus,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProduksiRecordDocumentEquality implements Equality<ProduksiRecord> {
  const ProduksiRecordDocumentEquality();

  @override
  bool equals(ProduksiRecord? e1, ProduksiRecord? e2) {
    return e1?.beratTebar == e2?.beratTebar &&
        e1?.ikan == e2?.ikan &&
        e1?.beratPanen == e2?.beratPanen &&
        e1?.status == e2?.status &&
        e1?.tanggalPanen == e2?.tanggalPanen &&
        e1?.tanggalTebar == e2?.tanggalTebar &&
        e1?.siklus == e2?.siklus &&
        e1?.tanggalSiklus == e2?.tanggalSiklus;
  }

  @override
  int hash(ProduksiRecord? e) => const ListEquality().hash([
        e?.beratTebar,
        e?.ikan,
        e?.beratPanen,
        e?.status,
        e?.tanggalPanen,
        e?.tanggalTebar,
        e?.siklus,
        e?.tanggalSiklus
      ]);

  @override
  bool isValidKey(Object? o) => o is ProduksiRecord;
}
