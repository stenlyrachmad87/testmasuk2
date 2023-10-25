import 'dart:convert';

class UserType {
  final String? firstName;
  UserType({
    this.firstName,
  });

  UserType copyWith({
    String? firstName,
  }) {
    return UserType(
      firstName: firstName ?? this.firstName,
    );
  }

  Map<String, dynamic> toMap(dynamic data) {
    return {
      'first_name': data,
    };
  }

  static UserType fromMap(Map<String, dynamic> map) {
    return UserType(
      firstName: map['first_name'],
    );
  }

  // String toJson() => json.encode(toMap());

  factory UserType.fromJson(String source) =>
      UserType.fromMap(json.decode(source));

  @override
  String toString() => 'UserType(first_name: $firstName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserType && other.firstName == firstName;
  }

  @override
  int get hashCode => firstName.hashCode;
}
