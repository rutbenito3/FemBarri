import '../database.dart';

class BarrisTable extends SupabaseTable<BarrisRow> {
  @override
  String get tableName => 'Barris';

  @override
  BarrisRow createRow(Map<String, dynamic> data) => BarrisRow(data);
}

class BarrisRow extends SupabaseDataRow {
  BarrisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BarrisTable();

  String get idBarri => getField<String>('idBarri')!;
  set idBarri(String value) => setField<String>('idBarri', value);

  String? get nomBarri => getField<String>('nomBarri');
  set nomBarri(String? value) => setField<String>('nomBarri', value);
}
