class UserModel {
  String? fullName;
  String? userName;
  String? email;
  String? password;

  UserModel({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password
  });

  factory UserModel.fromJons(Map<String, dynamic> json){
   return UserModel(
    fullName: json['fullName'], 
   userName: json['userName'],
    email: json['email'], 
    password: json['password']);

  }
}