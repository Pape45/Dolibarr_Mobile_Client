class Warehouse {
  String? id;
  String? label;
  String? description;
  String? status;
  String? address;
  String? zip;
  String? town;
  String? phone;
  String? fax;
  String? countryId;

  Warehouse({
    this.id,
    this.label,
    this.description,
    this.status,
    this.address,
    this.zip,
    this.town,
    this.phone,
    this.fax,
    this.countryId,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      id: json['id'],
      label: json['label'],
      description: json['description'],
      status: json['statut'],
      address: json['address'],
      zip: json['zip'],
      town: json['town'],
      phone: json['phone'],
      fax: json['fax'],
      countryId: json['country_id'],
    );
  }
}
