import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class KomunitasRecord extends FirestoreRecord {
  KomunitasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "namaKomunitas" field.
  String? _namaKomunitas;
  String get namaKomunitas => _namaKomunitas ?? '';
  bool hasNamaKomunitas() => _namaKomunitas != null;

  // "gambarKomunitas" field.
  String? _gambarKomunitas;
  String get gambarKomunitas => _gambarKomunitas ?? '';
  bool hasGambarKomunitas() => _gambarKomunitas != null;

  // "linkFB" field.
  String? _linkFB;
  String get linkFB => _linkFB ?? '';
  bool hasLinkFB() => _linkFB != null;

  // "linkWA" field.
  String? _linkWA;
  String get linkWA => _linkWA ?? '';
  bool hasLinkWA() => _linkWA != null;

  // "linkTG" field.
  String? _linkTG;
  String get linkTG => _linkTG ?? '';
  bool hasLinkTG() => _linkTG != null;

  // "kota" field.
  String? _kota;
  String get kota => _kota ?? '';
  bool hasKota() => _kota != null;

  void _initializeFields() {
    _namaKomunitas = snapshotData['namaKomunitas'] as String?;
    _gambarKomunitas = snapshotData['gambarKomunitas'] as String?;
    _linkFB = snapshotData['linkFB'] as String?;
    _linkWA = snapshotData['linkWA'] as String?;
    _linkTG = snapshotData['linkTG'] as String?;
    _kota = snapshotData['kota'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('komunitas');

  static Stream<KomunitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KomunitasRecord.fromSnapshot(s));

  static Future<KomunitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KomunitasRecord.fromSnapshot(s));

  static KomunitasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KomunitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KomunitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KomunitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KomunitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KomunitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKomunitasRecordData({
  String? namaKomunitas,
  String? gambarKomunitas,
  String? linkFB,
  String? linkWA,
  String? linkTG,
  String? kota,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'namaKomunitas': namaKomunitas,
      'gambarKomunitas': gambarKomunitas,
      'linkFB': linkFB,
      'linkWA': linkWA,
      'linkTG': linkTG,
      'kota': kota,
    }.withoutNulls,
  );

  return firestoreData;
}

class KomunitasRecordDocumentEquality implements Equality<KomunitasRecord> {
  const KomunitasRecordDocumentEquality();

  @override
  bool equals(KomunitasRecord? e1, KomunitasRecord? e2) {
    return e1?.namaKomunitas == e2?.namaKomunitas &&
        e1?.gambarKomunitas == e2?.gambarKomunitas &&
        e1?.linkFB == e2?.linkFB &&
        e1?.linkWA == e2?.linkWA &&
        e1?.linkTG == e2?.linkTG &&
        e1?.kota == e2?.kota;
  }

  @override
  int hash(KomunitasRecord? e) => const ListEquality().hash([
        e?.namaKomunitas,
        e?.gambarKomunitas,
        e?.linkFB,
        e?.linkWA,
        e?.linkTG,
        e?.kota
      ]);

  @override
  bool isValidKey(Object? o) => o is KomunitasRecord;
}
