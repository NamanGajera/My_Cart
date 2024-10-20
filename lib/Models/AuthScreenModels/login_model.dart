class LoginModel {
  String? token;
  String? id;
  String? email;

  LoginModel({this.token, this.id, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}
