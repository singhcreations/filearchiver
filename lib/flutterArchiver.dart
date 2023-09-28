import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'OLD/DatabaseHelper.dart';

class YourScreen2 extends StatefulWidget {
  String zipefilepath = 'assets/your_file.7z';
  @override
  _YourScreen2State createState() => _YourScreen2State();
}

class _YourScreen2State extends State<YourScreen2> {
  String dd = "";
  bool isExtracted = false;

  @override
  void initState() {
    super.initState();

    if (!isExtracted) {
      decompressZipFile().then((_) {
        setState(() {
          isExtracted = true; // Set the flag to true after extraction
        });
      });
    } else {
      decompressZipFile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Archiver Screen'),
      ),
      body: Center(
        child: isExtracted
            ? Text('ZIP file decompressed successfully.')
            : Text('Decompressing ZIP file...'),
      ),
    );
  }
}

Future<void> decompressZipFile() async {
  final appDir = await getApplicationDocumentsDirectory();
  final zipFile1 = File('${appDir.path}/your_file.7z');
  final ByteData data = await rootBundle.load('assets/your_file.7z');
  final buffer = data.buffer.asUint8List();
  await zipFile1.writeAsBytes(buffer);

  try {
    ZipFile.extractToDirectory(zipFile: zipFile1, destinationDir: appDir);
    print("ZIP file decompressed successfully.");
    print("Destination Directory: ${appDir.path}");
  } catch (e) {
    print("Error decompressing ZIP file: $e");
  }
}
