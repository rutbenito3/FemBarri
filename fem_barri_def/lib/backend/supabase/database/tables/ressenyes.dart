import '../database.dart';

class RessenyesTable extends SupabaseTable<RessenyesRow> {
  @override
  String get tableName => 'Ressenyes';

  @override
  RessenyesRow createRow(Map<String, dynamic> data) => RessenyesRow(data);
}

class RessenyesRow extends SupabaseDataRow {
  RessenyesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RessenyesTable();

  int get idRessenya => getField<int>('idRessenya')!;
  set idRessenya(int value) => setField<int>('idRessenya', value);

  int? get valoracions => getField<int>('Valoracions');
  set valoracions(int? value) => setField<int>('Valoracions', value);

  String? get comentari => getField<String>('Comentari');
  set comentari(String? value) => setField<String>('Comentari', value);

  String? get reviewSended => getField<String>('ReviewSended');
  set fKidUs(String? value) => setField<String>('FKid_Us', value);
  set reviewSended(String? value) => setField<String>('ReviewSended', value);
  
  String? get reviewGiven => getField<String>('ReviewGiven');
  set reviewGiven(String? value) => setField<String>('ReviewGiven', value);
}
