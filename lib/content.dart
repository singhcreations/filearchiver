import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OLD/DatabaseHelper.dart';

class YourScreen extends StatefulWidget {
  @override
  _YourScreenState createState() => _YourScreenState();
}

class _YourScreenState extends State<YourScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final result = await dbHelper.getlines();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Contents'),
      ),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text('ID: ${item['id']}'),
                  subtitle: Text('Name: ${item['name']}'),
                );
              },
            ),
    );
  }
}





