class SchoolUserModel {
  String name;
  String email;
  String phone;
  String uid;
  String image;

  SchoolUserModel({
    this.email,
    this.name,
    this.phone,
    this.uid,
    this.image,
  });
  SchoolUserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uid": uid,
    };
  }
}
