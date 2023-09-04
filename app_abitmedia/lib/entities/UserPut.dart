class UserPut {
  final int user_id;
  final String name;
  final String lastName;
  final String email;
  final String? password;

  UserPut(this.user_id, this.name, this.lastName, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password
    };
  }

  factory UserPut.fromJson(dynamic json) {
    return UserPut(json['user_id'] as int, json['name'] as String, json['lastName'] as String,
      json['email'] as String, json['password'] != null ? json['password'] as String : '',);
  }

  @override
  String toString() {
    return '{ $user_id, $name, $lastName, $email, $password }';
  }
}
