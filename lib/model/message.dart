import 'package:chatzera/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final UserListItem author;
  final String body;
  final DateTime createdAt;
  final String roomId;

  Message(this.author, this.body, this.createdAt, this.roomId);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
