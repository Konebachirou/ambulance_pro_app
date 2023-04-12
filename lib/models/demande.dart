class Demande {
  final String idDemande;
  final String refEtb;
  final String condTransp;
  final String date_dep;
  final String adresse_dep;
  final String adresse_arriv;
  final String estUrgent;
  final String estTraite;
  final String estFacture;

  Demande(
      {required this.idDemande,
      required this.refEtb,
      required this.condTransp,
      required this.date_dep,
      required this.adresse_dep,
      required this.adresse_arriv,
      required this.estUrgent,
      required this.estTraite,
      required this.estFacture});
}
