class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// Date and time when the profile was created
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['idUsuari'],
        username = map['nomPersona'],
        createdAt = DateTime.parse(map['created_at']);
}

class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.sentTo,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });


  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// ID of the user who posted the message
  final String sentTo;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        sentTo = map['sent_to'],
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['profile_id'];
}

class Usuario {
  final String idUsuari;
  final String username;
  
  Usuario({required this.idUsuari, required this.username});

  // Método para crear una instancia de Usuario desde un mapa
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuari: map['idUsuari'],
      username: map['nomPersona'],
    );
  }
}
