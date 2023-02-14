class User {
  final int code;
  final String token;
  final int entity;
  final String message;

  const User({
    required this.code,
    required this.token,
    required this.entity,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      code: int.parse(json['success']['code'].toString()),
      token: json['success']['token'] as String,
      entity: int.parse(json['success']['entity'].toString()),
      message: json['success']['message'] as String,
    );
  }
}
