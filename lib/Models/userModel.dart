class UserModel {
  String? userId;
  String? name;
  String? email;
  String? role;
  String? phone;
  String? profilePic;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.profilePic,
  });

  /// Create an instance from Firestore data
  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'] as String?,
      name: data['name'] as String?,
      email: data['email'] as String?,
      role: data['role'] as String?,
      phone: data['phone'] as String?,
      profilePic: data['profilePic'] as String?,
    );
  }

  /// Convert instance to JSON format (for updating fields)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'profilePic': profilePic,
    };
  }

  /// Create a copy with updated fields
  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? role,
    String? phone,
    String? profilePic,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
    );
  }
}
