class PointEntree {
  // Point d'entree de base de L'APi
  static const  String urlDeBase = 'http://10.106.98.100/api/index.php';


  static Authentification authPoint = Authentification();
}

class Authentification {
  final String login = '/login';
}
