// import 'package:mysql1/mysql1.dart';

// class BdController {
//   Future<List<dynamic>> getdata() async {
//     var settings = new ConnectionSettings(
//         host: 'localhost',
//         port: 3306,
//         user: 'root',
//         password: '',
//         db: 'kalywax');
//     var conn = await MySqlConnection.connect(settings);

//     var result = await conn.query('select * from produits');

//     return result.toList();
//   }
// }
