import 'package:file/content.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path_provider/path_provider.dart';
import '../custom_text.dart';
import '../custommodel.dart';
import 'package:path_provider/path_provider.dart' as path_prosvider;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// this screen refers to extraction and listview in ui on list view clcik diffrent data schow to schreen

class _HomeScreenState extends State<HomeScreen> {
  String _filetext = 'assets/your_file.7z';
  String _openfile = '';

  @override
  void initState() {
    super.initState();
    extractfile();
    setState(() {});
  }

  void extractfile() async {
    debugPrint("extraction is open in this part");
    // final appDocDir = await path_prosvider.getApplicationDocumentsDirectory();
    // final destinationDir = Directory('${appDocDir.path}/thedownloadedfiles');

   Directory _directory;
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
            ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: Mainlistitems.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.lightGreen)),
                      ),
                      child: InkWell(
                          onTap: () async {
                            if (index == 0) {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const ContentScreen()),
                              // );
                              // Daily Updates
                            } else if (index == 1) {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const ContentScreen()),
                              // ); // Nitnem
                            }
                          },
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(
                                      left: 2, top: 5, bottom: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //title
                                      CustomText(
                                        title: Mainlistitems[index].title,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          )));
                })
          ],
        ),
      ),
    );
  }
}
