import 'package:sqflite/sqflite.dart';

class TContact{
  int ? _id;
  String ?_number;
  String ? _name;

  TContact(this._number, this._name);
  TContact.withId(this._id,this._number,this._name);

  //getter
  int get id => _id!;
  String get number => _number!;
  String get name => _name!;

  @override
  String toString(){
  return 'contact:(id:$_id, name:$_name, number: $_number)';
  } 

  //setters
  set number(String newNumber) => this.number = newNumber;
  set name(String newName)=> this._name=newName;
}

class DatabaseHelper{
  String contactTable = 'contact_table';
  String colId = 'id';
  String colContactName = 'name';
  String colContactNumber = 'number';

  DatabaseHelper._createInstance();

 static DatabaseHelper ? _databaseHelper;

 factory DatabaseHelper(){
  if(_databaseHelper == null){
    _databaseHelper = DatabaseHelper._createInstance();
  }
  return _databaseHelper!;
 }


Future<Database> initializeDatabase() async{
  String directoryPath = await getDatabasesPath();
  String dbLocation = directoryPath.'contact.db';

  var contactDatabase = await openDatabase(dbLocation, version:1,onCreate:_createDbTable);
  return contactDatabase;

}

void _createDbTable(Database db, int newVersion) async{
  await db.execute(
    'CREATE TABLE $contactTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colContactName TEXT, $colContactNumber TEXT)');
}
//Fetch operation get contact object from db
Future<List<Map<String,dynamic>>>getContactMapList()async{
  Database db = await this.database;
  List<List<Map<String,dynamic>>> result = await db.rawQuery('SELECT * From $contactTable order by $colId ASC');
  return result;
}

//insert a contact object
Future<int> insertContact(TContact contact) async {
  Database db = await this.database;
  var result = await db.insert(contactTable,contact.toMap());
  return result;

//update a contact
// Future<int> update contact(TContact contact)async{
//   Database db = await this.database;
//   var result = await db.update(contactTable,contact.toMap(),where:$colId=?,whereArgs:)
// }
}
}