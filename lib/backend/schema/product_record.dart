import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "jenisProduk" field.
  String? _jenisProduk;
  String get jenisProduk => _jenisProduk ?? '';
  bool hasJenisProduk() => _jenisProduk != null;

  // "namaProduk" field.
  String? _namaProduk;
  String get namaProduk => _namaProduk ?? '';
  bool hasNamaProduk() => _namaProduk != null;

  // "hargaProduk" field.
  int? _hargaProduk;
  int get hargaProduk => _hargaProduk ?? 0;
  bool hasHargaProduk() => _hargaProduk != null;

  // "hargaDiskon" field.
  int? _hargaDiskon;
  int get hargaDiskon => _hargaDiskon ?? 0;
  bool hasHargaDiskon() => _hargaDiskon != null;

  // "toko" field.
  DocumentReference? _toko;
  DocumentReference? get toko => _toko;
  bool hasToko() => _toko != null;

  // "deskripsiProduk" field.
  String? _deskripsiProduk;
  String get deskripsiProduk => _deskripsiProduk ?? '';
  bool hasDeskripsiProduk() => _deskripsiProduk != null;

  // "gambarProduk" field.
  String? _gambarProduk;
  String get gambarProduk => _gambarProduk ?? '';
  bool hasGambarProduk() => _gambarProduk != null;

  // "shop" field.
  DocumentReference? _shop;
  DocumentReference? get shop => _shop;
  bool hasShop() => _shop != null;

  // "kota" field.
  String? _kota;
  String get kota => _kota ?? '';
  bool hasKota() => _kota != null;

  // "via" field.
  String? _via;
  String get via => _via ?? '';
  bool hasVia() => _via != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jenisProduk = snapshotData['jenisProduk'] as String?;
    _namaProduk = snapshotData['namaProduk'] as String?;
    _hargaProduk = castToType<int>(snapshotData['hargaProduk']);
    _hargaDiskon = castToType<int>(snapshotData['hargaDiskon']);
    _toko = snapshotData['toko'] as DocumentReference?;
    _deskripsiProduk = snapshotData['deskripsiProduk'] as String?;
    _gambarProduk = snapshotData['gambarProduk'] as String?;
    _shop = snapshotData['shop'] as DocumentReference?;
    _kota = snapshotData['kota'] as String?;
    _via = snapshotData['via'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('product')
          : FirebaseFirestore.instance.collectionGroup('product');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('product').doc();

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? jenisProduk,
  String? namaProduk,
  int? hargaProduk,
  int? hargaDiskon,
  DocumentReference? toko,
  String? deskripsiProduk,
  String? gambarProduk,
  DocumentReference? shop,
  String? kota,
  String? via,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jenisProduk': jenisProduk,
      'namaProduk': namaProduk,
      'hargaProduk': hargaProduk,
      'hargaDiskon': hargaDiskon,
      'toko': toko,
      'deskripsiProduk': deskripsiProduk,
      'gambarProduk': gambarProduk,
      'shop': shop,
      'kota': kota,
      'via': via,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.jenisProduk == e2?.jenisProduk &&
        e1?.namaProduk == e2?.namaProduk &&
        e1?.hargaProduk == e2?.hargaProduk &&
        e1?.hargaDiskon == e2?.hargaDiskon &&
        e1?.toko == e2?.toko &&
        e1?.deskripsiProduk == e2?.deskripsiProduk &&
        e1?.gambarProduk == e2?.gambarProduk &&
        e1?.shop == e2?.shop &&
        e1?.kota == e2?.kota &&
        e1?.via == e2?.via;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.jenisProduk,
        e?.namaProduk,
        e?.hargaProduk,
        e?.hargaDiskon,
        e?.toko,
        e?.deskripsiProduk,
        e?.gambarProduk,
        e?.shop,
        e?.kota,
        e?.via
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
