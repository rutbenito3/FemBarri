import '../database.dart';

class UsuarisTable extends SupabaseTable<UsuarisRow> {
  @override
  String get tableName => 'Usuaris';

  @override
  UsuarisRow createRow(Map<String, dynamic> data) => UsuarisRow(data);
}

class UsuarisRow extends SupabaseDataRow {
  UsuarisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarisTable();

  String get idUsuari => getField<String>('idUsuari')!;
  set idUsuari(String value) => setField<String>('idUsuari', value);

  String? get nomPersona => getField<String>('nomPersona');
  set nomPersona(String? value) => setField<String>('nomPersona', value);

  String? get cognoms => getField<String>('cognoms');
  set cognoms(String? value) => setField<String>('cognoms', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get usuari => getField<String>('usuari');
  set usuari(String? value) => setField<String>('usuari', value);

  String? get contrassenya => getField<String>('contrassenya');
  set contrassenya(String? value) => setField<String>('contrassenya', value);

  String? get telefon => getField<String>('telefon');
  set telefon(String? value) => setField<String>('telefon', value);

  String? get descripcioUsuari => getField<String>('descripcioUsuari');
  set descripcioUsuari(String? value) =>
      setField<String>('descripcioUsuari', value);

  String? get fotoUsuari => getField<String>('fotoUsuari');
  set fotoUsuari(String? value) => setField<String>('fotoUsuari', value);

  String? get fKIdBarri => getField<String>('FK_idBarri');
  set fKIdBarri(String? value) => setField<String>('FK_idBarri', value);

  int? get fKIdProducte => getField<int>('FK_idProducte');
  set fKIdProducte(int? value) => setField<int>('FK_idProducte', value);
}
