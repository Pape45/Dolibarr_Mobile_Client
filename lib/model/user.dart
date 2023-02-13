class User {
  final int successCode;
  final String token;
  final String entity;
  final String message;

  const User({
    required this.successCode,
    required this.token,
    required this.entity,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      successCode: json['success']['code'],
      token: json['success']['token'],
      entity: json['success']['entity'],
      message: json['success']['message'],
    );
  }
}
