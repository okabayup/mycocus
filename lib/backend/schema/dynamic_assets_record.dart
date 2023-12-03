import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DynamicAssetsRecord extends FirestoreRecord {
  DynamicAssetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tglUpdate" field.
  DateTime? _tglUpdate;
  DateTime? get tglUpdate => _tglUpdate;
  bool hasTglUpdate() => _tglUpdate != null;

  // "namaAsset" field.
  String? _namaAsset;
  String get namaAsset => _namaAsset ?? '';
  bool hasNamaAsset() => _namaAsset != null;

  // "asset" field.
  String? _asset;
  String get asset => _asset ?? '';
  bool hasAsset() => _asset != null;

  void _initializeFields() {
    _tglUpdate = snapshotData['tglUpdate'] as DateTime?;
    _namaAsset = snapshotData['namaAsset'] as String?;
    _asset = snapshotData['asset'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dynamic_assets');

  static Stream<DynamicAssetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DynamicAssetsRecord.fromSnapshot(s));

  static Future<DynamicAssetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DynamicAssetsRecord.fromSnapshot(s));

  static DynamicAssetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DynamicAssetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DynamicAssetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DynamicAssetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DynamicAssetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DynamicAssetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDynamicAssetsRecordData({
  DateTime? tglUpdate,
  String? namaAsset,
  String? asset,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tglUpdate': tglUpdate,
      'namaAsset': namaAsset,
      'asset': asset,
    }.withoutNulls,
  );

  return firestoreData;
}

class DynamicAssetsRecordDocumentEquality
    implements Equality<DynamicAssetsRecord> {
  const DynamicAssetsRecordDocumentEquality();

  @override
  bool equals(DynamicAssetsRecord? e1, DynamicAssetsRecord? e2) {
    return e1?.tglUpdate == e2?.tglUpdate &&
        e1?.namaAsset == e2?.namaAsset &&
        e1?.asset == e2?.asset;
  }

  @override
  int hash(DynamicAssetsRecord? e) =>
      const ListEquality().hash([e?.tglUpdate, e?.namaAsset, e?.asset]);

  @override
  bool isValidKey(Object? o) => o is DynamicAssetsRecord;
}
