class ThirdParty {
  int id;
  String name;
  String email;
  String phone;
  String address;

  ThirdParty({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.phone = "",
    this.address = "",
  });

  factory ThirdParty.fromJson(Map<String, dynamic> json) {
    return ThirdParty(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}
