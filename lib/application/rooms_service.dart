import '../mock/mock_rooms.dart';
import '../model/room.dart';

class RoomsService {
  List<Room> getRooms() {
    return mockRooms;
  }

  void addRoom(Room room) {
    mockRooms.add(room);
  }
}
