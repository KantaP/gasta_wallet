import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:gastawallet/src/constants/db.dart';
import 'package:gastawallet/src/data/local/datasource.abs.dart';
import 'package:gastawallet/src/features/authenticate/model/user.m.dart';
import 'package:gastawallet/src/features/authenticate/model/user.m.p.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@Singleton()
class UserDataSource extends DataSource<UserModel> {
  String tableName = "users";
  String columnId = "_id";
  String columnActionSetPin = "actionSetPin";
  String columnUid = "uid";
  String columnPin = "pin";

  late Database _db;

  final logger = Logger('users_db_log');

  UserDataSource() {
    create();
  }

  @override
  Future<int> delete(int id) {
    return _db.delete(tableName , where: '$columnId = ?' , whereArgs: [id]);
  }

  @override
  Future create() async {
    var databasesPath = await getDatabasesPath();
    _db = await openDatabase(join(databasesPath, DatabaseConstant.dbName));
    return await _db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        $columnId integer primary key autoincrement,
        $columnUid text not null,
        $columnActionSetPin INTEGER,
        $columnPin text null
      )
      ''').then((value) {
      logger.fine('$tableName table created');
    }).catchError((e) {
      logger.warning(e.toString());
    });
  }

  @override
  Future<List<UserModel>?> getByFilter(Map<String, dynamic> filters) async {
    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tableName,
        where: filters.keys.map((key) => '$key = ?').join(' AND '),
        whereArgs: filters.values.toList(),
      );
      if (maps.isNotEmpty) {
        return UserModelPersistence().fromArrayJson(maps);
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<UserModel> insert(UserModel item) async {
    final id = await _db.insert(
      tableName,
      UserModelPersistence().toLocalData(item),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
    item.setId(id);
    return item;
  }

  @override
  Future close() async {
    await _db.close();
  }

  @override
  Future<int> update(UserModel item) {
    return _db.update(
      tableName, 
      UserModelPersistence().toLocalData(item),
      where: '$columnId = ?',
      whereArgs: [item.id]
    );
  }
}
