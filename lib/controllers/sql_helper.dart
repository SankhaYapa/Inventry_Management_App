import 'package:inventry_management_app/model/room_model.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  //create and initialize db
  static Future<Database> initDB() async {
//storing the db in the device
//on android,data/data
//on iso,documents
    final dbPath = await getDatabasesPath();
    //best prcatice
    final path = join(dbPath, 'fsm.db');

    return openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }

  //create table
  static Future<void> createTables(Database database) async {
    await database.execute("""
CREATE TABLE Rooms(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rname TEXT
  createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
""");
  }

  //,,,,,,,,,,,,,,insert room,,,,,,,,,,//
  static Future<int> createRoom(String rname) async {
    final db = await initDB();

    final data = {'rname': rname};

    final id = await db.insert('Rooms', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //,,,,,,,,,,,,read all rooms from the room table
  static Future<List<RoomModel>> getRooms() async {
    final db = await initDB();
    //fetch rooms
    final result = await db.query('Rooms', orderBy: "id");

    //mapping fetch data to notes model and return
    return result.map((e) => RoomModel.fromJson(e)).toList();
  }

  //,,,,,,,,update room,,,,,//
  static Future<int> updateRoom(String rname) async {
    final db = await initDB();

    final data = {'rname': rname};

    final id = await db.insert('Rooms', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
}
