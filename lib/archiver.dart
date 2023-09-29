import 'dart:async';
import 'dart:io';

import 'package:file/flutterArchiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';

import 'display.dart';

class YourScreen3 extends StatefulWidget {
  @override
  _YourScreen3State createState() => _YourScreen3State();
}

class _YourScreen3State extends State<YourScreen3> {
  bool isExtracted = false;

  @override
  void initState() {
    super.initState();
    if (!isExtracted) {
      decompressZipFile().then((_) {
        setState(() {
          isExtracted = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Contents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isExtracted
                ? Text('ZIP file decompressed successfully.')
                : Text('Decompressing ZIP file...'),
                
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Display1()),
                );
                // Handle button tap here
              },
              child: Text('watch display content'),
              
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> decompressZipFile() async {
  try {
    final appDir = await getApplicationDocumentsDirectory();
    final zipFile = File('${appDir.path}/NEWDB.zip');
    final ByteData data = await rootBundle.load('assets/NEWDB.zip');
    final buffer = data.buffer.asUint8List();
    await zipFile.writeAsBytes(buffer);

    final archive =
        ZipDecoder().decodeBytes(File(zipFile.path).readAsBytesSync());
    for (final file in archive) {
      final filename = '${appDir.path}/${file.name}';
      if (file.isFile) {
        File(filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(file.content);
      } else {
        Directory(filename)..create(recursive: true);
      }
    }

    print("ZIP file decompressed successfully.");
    // print(await getDatabasesPath());
  } catch (e) {
    print("Error decompressing ZIP file: $e");
  }
}
