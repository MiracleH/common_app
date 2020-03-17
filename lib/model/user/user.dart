class User {
  String userName;
  String token;
  String profileImageUrl;

  User({this.userName, this.token, this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    token = json['token'];
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['token'] = this.token;
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}
