import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ShopRecord extends FirestoreRecord {
  ShopRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "namaToko" field.
  String? _namaToko;
  String get namaToko => _namaToko ?? '';
  bool hasNamaToko() => _namaToko != null;

  // "lokasiToko" field.
  LatLng? _lokasiToko;
  LatLng? get lokasiToko => _lokasiToko;
  bool hasLokasiToko() => _lokasiToko != null;

  // "gambarToko" field.
  String? _gambarToko;
  String get gambarToko => _gambarToko ?? '';
  bool hasGambarToko() => _gambarToko != null;

  // "pemilikToko" field.
  DocumentReference? _pemilikToko;
  DocumentReference? get pemilikToko => _pemilikToko;
  bool hasPemilikToko() => _pemilikToko != null;

  // "kotaToko" field.
  String? _kotaToko;
  String get kotaToko => _kotaToko ?? '';
  bool hasKotaToko() => _kotaToko != null;

  void _initializeFields() {
    _namaToko = snapshotData['namaToko'] as String?;
    _lokasiToko = snapshotData['lokasiToko'] as LatLng?;
    _gambarToko = snapshotData['gambarToko'] as String?;
    _pemilikToko = snapshotData['pemilikToko'] as DocumentReference?;
    _kotaToko = snapshotData['kotaToko'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shop');

  static Stream<ShopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopRecord.fromSnapshot(s));

  static Future<ShopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopRecord.fromSnapshot(s));

  static ShopRecord fromSnapshot(DocumentSnapshot snapshot) => ShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopRecordData({
  String? namaToko,
  LatLng? lokasiToko,
  String? gambarToko,
  DocumentReference? pemilikToko,
  String? kotaToko,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'namaToko': namaToko,
      'lokasiToko': lokasiToko,
      'gambarToko': gambarToko,
      'pemilikToko': pemilikToko,
      'kotaToko': kotaToko,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopRecordDocumentEquality implements Equality<ShopRecord> {
  const ShopRecordDocumentEquality();

  @override
  bool equals(ShopRecord? e1, ShopRecord? e2) {
    return e1?.namaToko == e2?.namaToko &&
        e1?.lokasiToko == e2?.lokasiToko &&
        e1?.gambarToko == e2?.gambarToko &&
        e1?.pemilikToko == e2?.pemilikToko &&
        e1?.kotaToko == e2?.kotaToko;
  }

  @override
  int hash(ShopRecord? e) => const ListEquality().hash(
      [e?.namaToko, e?.lokasiToko, e?.gambarToko, e?.pemilikToko, e?.kotaToko]);

  @override
  bool isValidKey(Object? o) => o is ShopRecord;
}
