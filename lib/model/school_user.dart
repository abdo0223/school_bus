class SchoolUserModel {
  String name;
  String email;
  String phone;
  String uid;
  String image;
  String childName;
  String chlildAddress;
  String schoolName;
  String schoollocation;

  SchoolUserModel({
    this.email,
    this.name,
    this.phone,
    this.uid,
    this.image,
    this.childName,
    this.chlildAddress,
    this.schoolName,
    this.schoollocation,
  });
  SchoolUserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
    childName = json['childName'];
    chlildAddress = json['chlildAddress'];
    schoolName = json['schoolName'];
    schoollocation = json['schoollocation'];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uid": uid,
      "image": image,
      "childName": childName,
      "chlildAddress": chlildAddress,
      "schoolName": schoolName,
      "schoollocation": schoollocation,
    };
  }
}
