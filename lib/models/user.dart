class User {
  int id;
  String nom;
  String? prenom;
  String? email;

  User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
    );
  }

  factory User.fromJson2(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      nom: json['data']['nom'],
      prenom: json['data']['prenom'],
      email: json['data']['email'],
    );
  }
}
