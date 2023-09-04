class User {
  final String name;
  final String lastName;
  final String email;
  final String? password;

  User(this.name, this.lastName, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password
    };
  }

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['lastName'] as String,
        json['email'] as String, json['password'] != null ? json['password'] as String : '',);
  }

  @override
  String toString() {
    return '{ $name, $lastName, $email, $password }';
  }
}
