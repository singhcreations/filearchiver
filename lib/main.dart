import 'package:file/flutterArchiver.dart';
import 'package:file/speechtotext.dart';
import 'package:flutter/material.dart';

import 'archiver.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // decompressAndCopyDatabase();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: YourScreen3());
  }

//   Future<void> decompressAndCopyDatabase() async {
//     try {
//       // Get the application document directory
//       final appDocDir = await getApplicationDocumentsDirectory();
//       final Directory databaseDirectory;
//       databaseDirectory = await getApplicationDocumentsDirectory();

//       // Path to the ZIP file you want to decompress (adjust as needed)

//       const zipFilePath = 'assets/your_file.7z';


//       // Extract the ZIP file to the application directory
//       final zipFile = File(zipFilePath);
//       await ZipFile.extractToDirectory(
//           zipFile: zipFile, destinationDir: databaseDirectory);

//       // Open the SQLite database
//       final databasePath = '$databaseDirectory/database.db';
//       final database = await openDatabase(databasePath);

//       // Now, you can access the database from multiple screens
//       // Example: await database.rawQuery('SELECT * FROM your_table');

//       print('Database decompressed and copied successfully');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
}
