import '../database.dart';

class DrumTable extends SupabaseTable<DrumRow> {
  @override
  String get tableName => 'drum';

  @override
  DrumRow createRow(Map<String, dynamic> data) => DrumRow(data);
}

class DrumRow extends SupabaseDataRow {
  DrumRow(super.data);

  @override
  SupabaseTable get table => DrumTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get waktuProduksi => getField<DateTime>('waktuProduksi');
  set waktuProduksi(DateTime? value) =>
      setField<DateTime>('waktuProduksi', value);

  double? get batchProduksi => getField<double>('batchProduksi');
  set batchProduksi(double? value) => setField<double>('batchProduksi', value);

  double? get versiHardware => getField<double>('versiHardware');
  set versiHardware(double? value) => setField<double>('versiHardware', value);
}
