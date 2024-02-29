import 'package:fem_barri_def/xat/chat.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'models.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const UsuariosPage(),
    );
  }

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  List<Usuario> _usuarios = [];
  final String myUserId = supabase.auth.currentUser!.id; // Obtener tu ID de usuario

  @override
  void initState() {
    super.initState();

    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
try {
  // Obtener los usuarios que tienen mensajes enviados por el usuario logeado
  final response = await supabase
      .from('messages')
      .select('sent_to')
      .eq('profile_id', myUserId)
      .execute();

  final userIds = <String>{};

  // Extraer los IDs de usuario únicos de los mensajes obtenidos
  for (var message in response.data as List) {
    userIds.add(message['sent_to']);
  }

  // Consultar la tabla de usuarios para obtener detalles de los usuarios
  final usuariosResponse = await supabase
      .from('Usuaris')
      .select()
      .in_('idUsuari', userIds.toList())
      .execute();

  final usuariosData = usuariosResponse.data as List;
  final usuarios = usuariosData.map((map) => Usuario.fromMap(map)).toList();

  setState(() {
    _usuarios = usuarios;
  });
} catch (error) {
  print('Error carregant usuaris: $error');
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuaris')),
      body: _usuarios.isEmpty
          ? const Center(child: Text('No hi ha usuaris disponibles'))
      :ListView.builder(
        itemCount: _usuarios.length,
        itemBuilder: (context, index) {
          final usuario = _usuarios[index];
          return ListTile(
            title: Text(usuario.username),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatPage(otherUserId: usuario.idUsuari),
                ),
              );
            },
          );
        },
      ),


          // : ListView.builder(
          //     itemCount: _usuarios.length,
          //     itemBuilder: (context, index) {
          //       final usuario = _usuarios[index];
          //       return ListTile(
          //         title: Text(usuario.username),
          //         onTap: () {
          //           Navigator.of(context).push(ChatPage.route());
          //         },
          //       );
          //     },
          //   ),
    );
  }
}