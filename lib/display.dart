import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OLD/DatabaseHelper.dart';

class Display1 extends StatefulWidget {
  @override
  _Display1State createState() => _Display1State();
}

class _Display1State extends State<Display1> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    dbHelper
        .initializeDatabase(
            '/data/user/0/com.example.file/app_flutter/database.sqlite')
        .then((_) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    final List<Map<String, dynamic>> fetchedData =
        await dbHelper.fetchDataFromDatabase();
    setState(() {
      data = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Content'),
      ),
      body: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name_english']),
                );
              },
            )
          : Container(),
    );
  }
}
