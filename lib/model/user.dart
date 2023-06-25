import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String Id;
  final String UserName;

  User(this.Id, this.UserName);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserListItem {
  final String userName;
  final String id;

  UserListItem(this.userName, this.id);

  factory UserListItem.fromJson(Map<String, dynamic> json) =>
      _$UserListItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserListItemToJson(this);
}
