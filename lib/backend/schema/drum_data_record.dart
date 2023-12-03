import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrumDataRecord extends FirestoreRecord {
  DrumDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "waktuData" field.
  DateTime? _waktuData;
  DateTime? get waktuData => _waktuData;
  bool hasWaktuData() => _waktuData != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "levelAir" field.
  double? _levelAir;
  double get levelAir => _levelAir ?? 0.0;
  bool hasLevelAir() => _levelAir != null;

  // "suhu" field.
  double? _suhu;
  double get suhu => _suhu ?? 0.0;
  bool hasSuhu() => _suhu != null;

  // "pH" field.
  double? _pH;
  double get pH => _pH ?? 0.0;
  bool hasPH() => _pH != null;

  // "drum" field.
  DocumentReference? _drum;
  DocumentReference? get drum => _drum;
  bool hasDrum() => _drum != null;

  // "siklus" field.
  int? _siklus;
  int get siklus => _siklus ?? 0;
  bool hasSiklus() => _siklus != null;

  // "jumlahPakan" field.
  double? _jumlahPakan;
  double get jumlahPakan => _jumlahPakan ?? 0.0;
  bool hasJumlahPakan() => _jumlahPakan != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _waktuData = snapshotData['waktuData'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _levelAir = castToType<double>(snapshotData['levelAir']);
    _suhu = castToType<double>(snapshotData['suhu']);
    _pH = castToType<double>(snapshotData['pH']);
    _drum = snapshotData['drum'] as DocumentReference?;
    _siklus = castToType<int>(snapshotData['siklus']);
    _jumlahPakan = castToType<double>(snapshotData['jumlahPakan']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('drumData')
          : FirebaseFirestore.instance.collectionGroup('drumData');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('drumData').doc();

  static Stream<DrumDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrumDataRecord.fromSnapshot(s));

  static Future<DrumDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrumDataRecord.fromSnapshot(s));

  static DrumDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrumDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrumDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrumDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrumDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrumDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrumDataRecordData({
  DateTime? waktuData,
  DocumentReference? user,
  double? levelAir,
  double? suhu,
  double? pH,
  DocumentReference? drum,
  int? siklus,
  double? jumlahPakan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'waktuData': waktuData,
      'user': user,
      'levelAir': levelAir,
      'suhu': suhu,
      'pH': pH,
      'drum': drum,
      'siklus': siklus,
      'jumlahPakan': jumlahPakan,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrumDataRecordDocumentEquality implements Equality<DrumDataRecord> {
  const DrumDataRecordDocumentEquality();

  @override
  bool equals(DrumDataRecord? e1, DrumDataRecord? e2) {
    return e1?.waktuData == e2?.waktuData &&
        e1?.user == e2?.user &&
        e1?.levelAir == e2?.levelAir &&
        e1?.suhu == e2?.suhu &&
        e1?.pH == e2?.pH &&
        e1?.drum == e2?.drum &&
        e1?.siklus == e2?.siklus &&
        e1?.jumlahPakan == e2?.jumlahPakan;
  }

  @override
  int hash(DrumDataRecord? e) => const ListEquality().hash([
        e?.waktuData,
        e?.user,
        e?.levelAir,
        e?.suhu,
        e?.pH,
        e?.drum,
        e?.siklus,
        e?.jumlahPakan
      ]);

  @override
  bool isValidKey(Object? o) => o is DrumDataRecord;
}
