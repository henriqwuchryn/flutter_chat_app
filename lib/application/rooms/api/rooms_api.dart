import 'package:chatzera/model/room.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms_api.g.dart';

@Injectable()
class RoomsApi {
  RoomsApi(this.dio);

  final Dio dio;

  Future<List<Room>> listRooms() async {
    var request = await dio.get("/Rooms");
    List<Room> roomList = request.data
        .map<Room>(
          (element) => Room.fromJson(element),
        )
        .toList();
    return roomList;
  }

  Future<Room> getRoomById(String roomId) async {
    var request = await dio.get("/Rooms/$roomId");
    Room room = Room.fromJson(request.data);
    return room;
  }

  Future<void> postRoom(PostRoomDto dto) async {
    var requestBody = dto.toJson();
    await dio.post("/Me/Room", data: requestBody);
  }

  Future<void> joinRoom(String roomId) async {
    await dio.post("/Rooms/$roomId/Join");
  } //unimplemented

  Future<void> patchRoom(String roomId, PatchRoomDto dto) async {
    var requestBody = dto.toJson();
    await dio.patch("/Me/Room/$roomId", data: requestBody);
  }

  Future<void> deleteRoom(String roomId) async {
    await dio.delete("/Me/Room/$roomId");
  }
}

@JsonSerializable()
class PostRoomDto {
  final String name;
  final String description;

  PostRoomDto(this.name, this.description);

  factory PostRoomDto.fromJson(Map<String, dynamic> json) =>
      _$PostRoomDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostRoomDtoToJson(this);
}

@JsonSerializable()
class PatchRoomDto {
  final String name;
  final String description;

  PatchRoomDto(this.name, this.description);

  factory PatchRoomDto.fromJson(Map<String, dynamic> json) =>
      _$PatchRoomDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PatchRoomDtoToJson(this);
}
