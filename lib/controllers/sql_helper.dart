import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:logger/logger.dart';
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
    try {
      await database.execute(
          "CREATE TABLE Rooms("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "rname TEXT,"
              "rquantity TEXT,"
              "createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)");
      await database.execute("""CREATE TABLE Items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            iname TEXT,
            mesure TEXT,
            room TEXT,
            quantity TEXT,
            createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
    } catch (e) {
      print(e);
    }
  }

  //,,,,,,,,,,,,,,insert room,,,,,,,,,,//
  static Future<int> createRoom(String rname) async {
    final db = await initDB();

    final data = {'rname': rname, 'rquantity': 0};

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
  static Future<int> updateRoom(int id, String rname) async {
    final db = await initDB();

    final data = {'rname': rname, 'createdAt': DateTime.now().toString()};
//,,,,,,using whereArgs to prevent sql injection
    final resultid =
        await db.update('Rooms', data, where: "id=?", whereArgs: [id]);
    return resultid;
  }

  ////update room quantity/////
  static Future<void> updateRoomQuantity(int id, String rquantity) async {
    final db = await initDB();

    // final res = await db
    //     .execute("UPDATE Items SET quantity='12' WHERE id = '$id'");

    final res = await db.execute("""
                    UPDATE Rooms
                    SET rquantity = '$rquantity'
                    WHERE id = $id;
                    
                    """);
  }

  //,,,,,,,,delete room,,,,,//
  static Future<void> deleteRoom(int id) async {
    final db = await initDB();

//,,,,,,using whereArgs to prevent sql injection

    await db.delete('Rooms', where: "id=?", whereArgs: [id]);
  }

//////////////////////////////////////////////////////////////
  //,,,,,,,,,,,,,,insert item,,,,,,,,,,//
  static Future<int> createItem(
      String iname, String selectalue, String selectValueR) async {
    final db = await initDB();

    // final data = {'iname': iname};
    // final data2 = {'mesure': selectalue};
    final data = {
      'iname': iname,
      'mesure': selectalue,
      'room': selectValueR,
      'quantity': 0,
    };

    final id = await db.insert('Items', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  //,,,,,,,,,,,,read all Items from the item table
  static Future<List<ItemModel>> getItems() async {
    final db = await initDB();
    //fetch rooms
    final result = await db.query('Items', orderBy: "id");

    //mapping fetch data to notes model and return
    return result.map((e) => ItemModel.fromJson(e)).toList();
  }

  //,,,,,,,,update item,,,,,//
  static Future<int> updateItem(
      int id, String iname, String mes, String selectValueR) async {
    final db = await initDB();
    //final data = {'iname': iname, 'mesure': selectalue};

    final data = {
      'iname': iname,
      'mesure': mes,
      'room': selectValueR,
      'createdAt': DateTime.now().toString(),
    };
//,,,,,,using whereArgs to prevent sql injection
    final resultid =
        await db.update('Items', data, where: "id=?", whereArgs: [id]);
    return resultid;
  }

////update product quantity/////
  static Future<void> updateProductQty(int id, String quantity) async {
    final db = await initDB();

    // final res = await db
    //     .execute("UPDATE Items SET quantity='12' WHERE id = '$id'");

    final res = await db.execute("""
                    UPDATE Items
                    SET quantity = '$quantity'
                    WHERE id = $id;
                    
                    """);
  }

  //,,,,,,,,delete item,,,,,//
  static Future<void> deleteItem(int id) async {
    final db = await initDB();

//,,,,,,using whereArgs to prevent sql injection

    await db.delete('Items', where: "id=?", whereArgs: [id]);
  }

  //,,,,,,,,,,,,read all Items from the item table Lastweek
  // static Future<List<ItemModel>> getItemsLastWeek() async {
  //   final db = await initDB();
  //   //fetch rooms
  //   final result = await db.query('Items', where: "iname=sankha");

  //   Logger().e(result);

  //   //mapping fetch data to notes model and return
  //   return result.map((e) => ItemModel.fromJson(e)).toList();
  // }
}
