import 'package:chatzera/model/message.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_api.g.dart';

@Injectable()
class MessagesApi {
  MessagesApi(this.dio);

  final Dio dio;

  Future<void> postMessage(PostMessageDto dto) async {
    await dio.post("/Me/Message",
        data: {'body': dto.body}, queryParameters: {'roomId': dto.roomId});
  }

  Future<List<Message>> listMessages(String roomId) async {
    final request = await dio.get("/Rooms/$roomId/Messages");
    List<Message> messageList = (request.data)
        .map<Message>((element) => Message.fromJson(element))
        .toList();
    return messageList;
  }

  // Future<Message> getMessage(GetMessageDto dto) async {
  //   var request =
  //       await dio.get("/Rooms/${dto.roomId}/Messages/${dto.messageId}");
  //   Message message = (request.data).map<Message>((element) =>
  //   Message.fromJson(element);
  //   return message;
  // }

  Future<void> patchMessage(PatchMessageDto dto) async {
    await dio.patch("/Me/Message/${dto.messageId}", data: {"body": dto.body});
  }

  Future<void> deleteMessage(String messageId) async {
    await dio.delete("/Me/Messages/$messageId");
  }
}

@JsonSerializable()
class GetMessageDto {
  GetMessageDto(this.roomId, this.messageId);

  final String roomId;
  final String messageId;

  factory GetMessageDto.fromJson(Map<String, dynamic> json) =>
      _$GetMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessageDtoToJson(this);
}

class PatchMessageDto {
  final String messageId;
  final String body;

  PatchMessageDto(this.messageId, this.body);
}

class PostMessageDto {
  final String roomId;
  final String body;

  PostMessageDto(this.roomId, this.body);
}
