class Warehouse {
  String id;
  String label;
  String description;
  String address;
  String zip;
  String town;
  String phone;

  Warehouse({
    required this.id,
    required this.label,
    required this.description,
    required this.address,
    required this.zip,
    required this.town,
    required this.phone,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      id: json['id'],
      label: json['label'],
      description: json['description'],
      address: json['address'],
      zip: json['zip'],
      town: json['town'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'description': description,
        'address': address,
        'zip': zip,
        'town': town,
        'phone': phone,
      };
}
