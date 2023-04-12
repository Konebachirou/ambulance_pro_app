class Mission {
  int id;
  int demande;
  String? heureDeb;
  String? heureFin;
  String? commentaire;
  int chauffeurP;
  int chauffeurS;
  String vehicule;
  String adresseDep;
  String adresseArriv;

  Mission({
    required this.demande,
    required this.heureDeb,
    required this.heureFin,
    required this.commentaire,
    required this.id,
    required this.chauffeurP,
    required this.chauffeurS,
    required this.vehicule,
    required this.adresseDep,
    required this.adresseArriv,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'],
      demande: json['demande'],
      heureDeb: json['heureDeb'],
      heureFin: json['heureFin'],
      commentaire: json['commentaire'],
      chauffeurP: json['chauffeurP'],
      chauffeurS: json['chauffeurS'],
      vehicule: json['vehicule'].toString(),
      adresseArriv: json['adresseArriv'],
      adresseDep: json['adresseDep'],
    );
  }

  factory Mission.fromJson2(Map<String, dynamic> json) {
    return Mission(
      id: json['data']['id'],
      demande: json['data']['demande'],
      heureDeb: json['data']['heureDeb'],
      heureFin: json['data']['heureFin'],
      commentaire: json['data']['commentaire'],
      chauffeurP: json['data']['chauffeurP'],
      chauffeurS: json['data']['chauffeurS'],
      vehicule: json['data']['vehicule'].toString(),
      adresseArriv: json['data']['adresseArriv'],
      adresseDep: json['data']['adresseDep'],
    );
  }
}
