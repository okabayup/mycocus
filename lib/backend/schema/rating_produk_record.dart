import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RatingProdukRecord extends FirestoreRecord {
  RatingProdukRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "produk" field.
  DocumentReference? _produk;
  DocumentReference? get produk => _produk;
  bool hasProduk() => _produk != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "komentarProduk" field.
  String? _komentarProduk;
  String get komentarProduk => _komentarProduk ?? '';
  bool hasKomentarProduk() => _komentarProduk != null;

  void _initializeFields() {
    _rating = castToType<double>(snapshotData['rating']);
    _produk = snapshotData['produk'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _komentarProduk = snapshotData['komentarProduk'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratingProduk');

  static Stream<RatingProdukRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingProdukRecord.fromSnapshot(s));

  static Future<RatingProdukRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingProdukRecord.fromSnapshot(s));

  static RatingProdukRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingProdukRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingProdukRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingProdukRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingProdukRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingProdukRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingProdukRecordData({
  double? rating,
  DocumentReference? produk,
  DocumentReference? user,
  String? komentarProduk,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'produk': produk,
      'user': user,
      'komentarProduk': komentarProduk,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingProdukRecordDocumentEquality
    implements Equality<RatingProdukRecord> {
  const RatingProdukRecordDocumentEquality();

  @override
  bool equals(RatingProdukRecord? e1, RatingProdukRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.produk == e2?.produk &&
        e1?.user == e2?.user &&
        e1?.komentarProduk == e2?.komentarProduk;
  }

  @override
  int hash(RatingProdukRecord? e) => const ListEquality()
      .hash([e?.rating, e?.produk, e?.user, e?.komentarProduk]);

  @override
  bool isValidKey(Object? o) => o is RatingProdukRecord;
}
