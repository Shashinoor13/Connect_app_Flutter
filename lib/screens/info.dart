class Information {
  final int? index;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;

  Information({
    this.index,
    this.name,
    this.email,
    this.phone,
    this.photo,
  });

  factory Information.fromJSON(dynamic json) {
    int index = 0;
    return Information(
      index: index,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['cell'] as String?,
      photo: json['picture'] as String?,
    );
  }

  static List<Information> informationFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Information.fromJSON(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Information { name=$name ,email=$email ,phone=$phone ,picture=$photo?}';
  }
}
