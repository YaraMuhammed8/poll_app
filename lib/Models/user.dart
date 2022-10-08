class User {
  String? username;
  String? password;
  String? token;

  User({this.username, this.password, this.token});

  User.FromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
  toJson() {
    return {"user_name": username, "password": password};
  }
}