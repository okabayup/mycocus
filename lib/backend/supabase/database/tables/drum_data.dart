import '../database.dart';

class DrumDataTable extends SupabaseTable<DrumDataRow> {
  @override
  String get tableName => 'drumData';

  @override
  DrumDataRow createRow(Map<String, dynamic> data) => DrumDataRow(data);
}

class DrumDataRow extends SupabaseDataRow {
  DrumDataRow(super.data);

  @override
  SupabaseTable get table => DrumDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get jumlahPakan => getField<double>('jumlahPakan');
  set jumlahPakan(double? value) => setField<double>('jumlahPakan', value);

  double? get levelAir => getField<double>('levelAir');
  set levelAir(double? value) => setField<double>('levelAir', value);

  double? get ph => getField<double>('ph');
  set ph(double? value) => setField<double>('ph', value);

  double? get siklus => getField<double>('siklus');
  set siklus(double? value) => setField<double>('siklus', value);

  double? get suhu => getField<double>('suhu');
  set suhu(double? value) => setField<double>('suhu', value);

  int get drumRef => getField<int>('drumRef')!;
  set drumRef(int value) => setField<int>('drumRef', value);
}
