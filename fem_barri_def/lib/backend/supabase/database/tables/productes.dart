import '../database.dart';

class ProductesTable extends SupabaseTable<ProductesRow> {
  @override
  String get tableName => 'Productes';

  @override
  ProductesRow createRow(Map<String, dynamic> data) => ProductesRow(data);
}

class ProductesRow extends SupabaseDataRow {
  ProductesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductesTable();

  int get idProducte => getField<int>('idProducte')!;
  set idProducte(int value) => setField<int>('idProducte', value);

  String get nomProducte => getField<String>('nomProducte')!;
  set nomProducte(String value) => setField<String>('nomProducte', value);

  String? get descProducte => getField<String>('descProducte');
  set descProducte(String? value) => setField<String>('descProducte', value);

  String? get fotoProducte => getField<String>('fotoProducte');
  set fotoProducte(String? value) => setField<String>('fotoProducte', value);

  int? get fKIdCat => getField<int>('FK_idCat');
  set fKIdCat(int? value) => setField<int>('FK_idCat', value);

  int? get raiting => getField<int>('raiting');
  set raiting(int? value) => setField<int>('raiting', value);

  String? get fKidUs => getField<String>('FKid_Us');
  set fKidUs(String? value) => setField<String>('FKid_Us', value);

  String? get fKNomCat => getField<String>('FK_nomCat');
  set fKNomCat(String? value) => setField<String>('FK_nomCat', value);
}
