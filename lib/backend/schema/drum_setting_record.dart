import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DrumSettingRecord extends FirestoreRecord {
  DrumSettingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "waktuPakan" field.
  List<int>? _waktuPakan;
  List<int> get waktuPakan => _waktuPakan ?? const [];
  bool hasWaktuPakan() => _waktuPakan != null;

  // "waktuGantiAir" field.
  int? _waktuGantiAir;
  int get waktuGantiAir => _waktuGantiAir ?? 0;
  bool hasWaktuGantiAir() => _waktuGantiAir != null;

  // "settingUpdate" field.
  DateTime? _settingUpdate;
  DateTime? get settingUpdate => _settingUpdate;
  bool hasSettingUpdate() => _settingUpdate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "drum" field.
  DocumentReference? _drum;
  DocumentReference? get drum => _drum;
  bool hasDrum() => _drum != null;

  // "pakanDiberi" field.
  int? _pakanDiberi;
  int get pakanDiberi => _pakanDiberi ?? 0;
  bool hasPakanDiberi() => _pakanDiberi != null;

  // "persenGantiAir" field.
  int? _persenGantiAir;
  int get persenGantiAir => _persenGantiAir ?? 0;
  bool hasPersenGantiAir() => _persenGantiAir != null;

  // "siklus" field.
  int? _siklus;
  int get siklus => _siklus ?? 0;
  bool hasSiklus() => _siklus != null;

  // "hariGantiAir" field.
  String? _hariGantiAir;
  String get hariGantiAir => _hariGantiAir ?? '';
  bool hasHariGantiAir() => _hariGantiAir != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _waktuPakan = getDataList(snapshotData['waktuPakan']);
    _waktuGantiAir = castToType<int>(snapshotData['waktuGantiAir']);
    _settingUpdate = snapshotData['settingUpdate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _drum = snapshotData['drum'] as DocumentReference?;
    _pakanDiberi = castToType<int>(snapshotData['pakanDiberi']);
    _persenGantiAir = castToType<int>(snapshotData['persenGantiAir']);
    _siklus = castToType<int>(snapshotData['siklus']);
    _hariGantiAir = snapshotData['hariGantiAir'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('drumSetting')
          : FirebaseFirestore.instance.collectionGroup('drumSetting');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('drumSetting').doc();

  static Stream<DrumSettingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrumSettingRecord.fromSnapshot(s));

  static Future<DrumSettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrumSettingRecord.fromSnapshot(s));

  static DrumSettingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrumSettingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrumSettingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrumSettingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrumSettingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrumSettingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrumSettingRecordData({
  int? waktuGantiAir,
  DateTime? settingUpdate,
  DocumentReference? user,
  DocumentReference? drum,
  int? pakanDiberi,
  int? persenGantiAir,
  int? siklus,
  String? hariGantiAir,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'waktuGantiAir': waktuGantiAir,
      'settingUpdate': settingUpdate,
      'user': user,
      'drum': drum,
      'pakanDiberi': pakanDiberi,
      'persenGantiAir': persenGantiAir,
      'siklus': siklus,
      'hariGantiAir': hariGantiAir,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrumSettingRecordDocumentEquality implements Equality<DrumSettingRecord> {
  const DrumSettingRecordDocumentEquality();

  @override
  bool equals(DrumSettingRecord? e1, DrumSettingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.waktuPakan, e2?.waktuPakan) &&
        e1?.waktuGantiAir == e2?.waktuGantiAir &&
        e1?.settingUpdate == e2?.settingUpdate &&
        e1?.user == e2?.user &&
        e1?.drum == e2?.drum &&
        e1?.pakanDiberi == e2?.pakanDiberi &&
        e1?.persenGantiAir == e2?.persenGantiAir &&
        e1?.siklus == e2?.siklus &&
        e1?.hariGantiAir == e2?.hariGantiAir;
  }

  @override
  int hash(DrumSettingRecord? e) => const ListEquality().hash([
        e?.waktuPakan,
        e?.waktuGantiAir,
        e?.settingUpdate,
        e?.user,
        e?.drum,
        e?.pakanDiberi,
        e?.persenGantiAir,
        e?.siklus,
        e?.hariGantiAir
      ]);

  @override
  bool isValidKey(Object? o) => o is DrumSettingRecord;
}
