import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as path_prosvider;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filetext = '';
  String _openfile = '';

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void extractfile() async {
    debugPrint("extraction is open in this part");
    final appDocDir = await path_prosvider.getApplicationDocumentsDirectory();
    final destinationDir = Directory('${appDocDir.path}/thedownloadedfiles');

    Directory _directory = Directory("");
    _directory = await getApplicationDocumentsDirectory();

    //our endpoint is find so that we start our extraction method
    try {
      //exxtraction method is call
      await ZipFile.extractToDirectory(
        zipFile: File(
            _filetext), // which file we choose is set in zipfile (in this _filetext : we picked file in above)
        destinationDir:
            _directory, // mention our endpoint location to save extracted files
      );
      debugPrint('ZIP file extracted to: ${_directory.path}');
    } catch (e) {
      //if any error occure which is shown in this part
      debugPrint("error");
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("files"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        extractfile();
                        setState(() {});
                      },
                      child: const Text("Extract Files")),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
