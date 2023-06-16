import 'dart:async';
import '../../../application/rooms/rooms_api.dart';
import '../../model/room.dart';

class RoomsService {
  static RoomsService? _instance;
  static RoomsService get instance {
    return _instance ??= RoomsService._constructor();
  }

  final RoomsApi _roomsApi = RoomsApi();

  late StreamController<List<Room>> roomsStreamController;

  Stream<List<Room>> getRooms() {
    return roomsStreamController.stream;
  }

  Future<Room> getRoomById(String roomId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _roomsApi.getRoomById(roomId);
  }

  void addRoom(String roomName) {
    _roomsApi.postRoom(roomName);
    _roomsApi.listRooms().then((value) => roomsStreamController.add(value));
  }

  RoomsService._constructor() {
    roomsStreamController = StreamController.broadcast(
        onListen: () => _roomsApi
            .listRooms()
            .then((value) => roomsStreamController.add(value)));
  }
}
