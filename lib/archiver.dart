import 'dart:async';
import 'dart:io';

import 'package:file/flutterArchiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'custom_text.dart';
import 'custominkwell.dart';
import 'custommodel.dart';
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
      body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            itemCount: amritvelaWakeUpCallScreenList.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                padding: const EdgeInsets.only(bottom: 8,),
                child: CustomInkWell(
                  onTap: () {
                    if (index == 0) {
                       Navigator.push(context,MaterialPageRoute(builder: (context) => Display1()),);
                      // Daily Updates
                    } else if (index == 1) {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Display1()),);
                      // Nitnem
                    }
                    else{
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Display1()),);
                    }
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 110,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/Images/dailyUpdates.jpg"))
                            ),
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 8,top: 8,bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //title
                                    CustomText(
                                      title: amritvelaWakeUpCallScreenList[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ) ,
                                    //Space
                                    SizedBox(height: 5,),
                                    //subtitle
                                    CustomText(
                                      title: amritvelaWakeUpCallScreenList[index].subTitle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ) ,
                                    //Space
                                    SizedBox(height: 3,),
                                    //Description
                                    CustomText(
                                      title: amritvelaWakeUpCallScreenList[index].description,
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ) ,
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
    );
  }

  Future<void> decompressZipFile() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final zipFile = File('${appDir.path}/NEWDB.zip');
      final ByteData data = await rootBundle.load('assets/NEWDB.zip');
      final buffer = data.buffer.asUint8List();
      var res = await zipFile.writeAsBytes(buffer);
      print(res);
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
    } catch (e) {
      print("Error decompressing ZIP file: $e");
    }
  }
}


