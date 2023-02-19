class PointEntree {
  // Point d'entree de base de L'APi
  static const  String urlDeBase = 'http://localhost/dolibarr16-04/api/index.php';


  static Authentification authPoint = Authentification();
}

class Authentification {
  final String login = '/login';
}
