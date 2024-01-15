import '../database.dart';

class CategoriesTable extends SupabaseTable<CategoriesRow> {
  @override
  String get tableName => 'Categories';

  @override
  CategoriesRow createRow(Map<String, dynamic> data) => CategoriesRow(data);
}

class CategoriesRow extends SupabaseDataRow {
  CategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CategoriesTable();

  int get idCategoria => getField<int>('idCategoria')!;
  set idCategoria(int value) => setField<int>('idCategoria', value);

  String get tipus => getField<String>('Tipus')!;
  set tipus(String value) => setField<String>('Tipus', value);
}
