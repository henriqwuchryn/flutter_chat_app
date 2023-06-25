import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../model/room.dart';
import 'api/rooms_api.dart';

@Singleton()
class RoomsService {
  RoomsService(this._roomsApi);

  final RoomsApi _roomsApi;
  Rx<List<Room>?> roomListRx = Rx<List<Room>?>(null);

  List<Room>? get roomList {
    return roomListRx.value;
  }

  Future<void> loadRooms() async {
    roomListRx.value = await _roomsApi.listRooms();
  }

  Stream<List<Room>?> getRoomsStream() {
    return roomListRx.stream;
  }

  Future<Room> getRoomById(String roomId) async {
    return _roomsApi.getRoomById(roomId);
  }

  Future<void> addRoom(String roomName, String description) async {
    var dto = PostRoomDto(roomName, description);
    await _roomsApi.postRoom(dto);
    loadRooms();
  }

  Future<void> editRoom(
      String roomId, String roomName, String description) async {
    var dto = PatchRoomDto(roomName, description);
    await _roomsApi.patchRoom(roomId, dto);
    loadRooms();
  }

  Future<void> deleteRoom(String roomId) async {
    await _roomsApi.deleteRoom(roomId);
    loadRooms();
  }
}
