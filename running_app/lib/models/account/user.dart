class User {
  final String? id;
  final String? email;
  final String? username;
  final String? phoneNumber;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        username = json['username'],
        phoneNumber = json['phone_number'];



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone_number': phoneNumber,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, username: $username, phoneNumber: $phoneNumber}';
  }
}

class DetailUser extends User {
  final bool isVerifiedEmail;
  final bool isVerifiedPhone;
  final String activity;
  final String performance;
  final String profile;
  final String privacy;

  DetailUser({
    String? id,
    String? email,
    String? username,
    String? phoneNumber,
    required this.isVerifiedEmail,
    required this.isVerifiedPhone,
    required this.activity,
    required this.profile,
    required this.performance,
    required this.privacy,

  }) : super(
    id: id,
    email: email,
    username: username,
    phoneNumber: phoneNumber,
  );

  DetailUser.fromJson(Map<String, dynamic> json)
      : isVerifiedEmail = json['is_verified_email'],
        activity = json['activity'],
        profile = json['profile'] ?? "" ,
        performance = json['performance'] ?? "" ,
        privacy = json['privacy'] ?? "" ,
        isVerifiedPhone = json['is_verified_phone'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['is_verified_email'] = isVerifiedEmail;
    data['is_verified_phone'] = isVerifiedPhone;
    data['activity'] = activity;
    data['performance'] = performance;
    data['privacy'] = privacy;
    data['profile'] = profile;
    return data;
  }

  @override
  String toString() {
    return 'DetailUser{\n\t'
        'id: $id,\n\t '
        'email: $email,\n\t '
        'username: $username,\n\t '
        'phoneNumber: $phoneNumber,\n\t '
        'isVerifiedEmail: ${isVerifiedEmail.toString()},\n\t '
        'isVerifiedPhone: ${isVerifiedPhone.toString()},\n\t '
        'activity: $activity,\n\t'
        'performance: $performance,\n\t'
        'privacy: $privacy,\n\t'
        'profile: $profile \n'
        '},\n';
  }
}

class CreateUser {
  final String? id;
  final String? username;
  final String? email;
  final String? password;

  CreateUser({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
