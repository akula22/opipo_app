class UserModel {
  final int id;
  final String username;
  final int created_at;
  final String middlename;
  final String phone;

  UserModel({
    required this.id,
    required this.username,
    required this.created_at,
    required this.middlename,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json['profile']['middlename'] == null)
      json['profile']['middlename'] = '';
    return UserModel(
      id: int.parse(json['id']),
      username: json['username'],
      created_at: int.parse(json['created_at']),
      middlename: json['profile']['middlename'],
      phone: json['phone'],
    );
  }
}
