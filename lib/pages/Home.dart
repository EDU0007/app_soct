import 'dart:io';

import 'package:app/models/band.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'scorpion', votes: 1),
    Band(id: '2', name: 'scorpion', votes: 4),
    Band(id: '3', name: 'scorpion', votes: 7),
    Band(id: '3', name: 'scorpion', votes: 3),
    Band(id: '4', name: 'scorpion', votes: 7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shadowColor: Colors.amber,
        actions: [],
        title: Text(
          'BandNamews',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => _buildListTile(bands[i]),
        itemCount: bands.length,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewband,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('id : ${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 20),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Text(
          'Delete band',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewband() {
    final TextEditingController textController = new TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New band name'),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(),
              ),
              child: TextFormField(
                controller: textController,
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () => addband(textController.text),
                child: Text('Add'),
                textColor: Colors.blue,
                elevation: 5,
              )
            ],
          );
        },
      );
    }
  }

  void addband(String name) {
    print(name);
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
