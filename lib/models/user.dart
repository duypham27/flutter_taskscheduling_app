class UserModel {
  final int id;
  final String email;
  final String username;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  // Phương thức từ JSON thành object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Phương thức từ object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
