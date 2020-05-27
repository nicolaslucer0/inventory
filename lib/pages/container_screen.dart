import 'package:flutter/material.dart';
import 'package:inventory/database/database.dart';
import 'package:inventory/models/ContainerModel.dart';
import 'dart:math' as math;

import 'package:inventory/routes.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  List<Client> testClients = [
    Client(firstName: "Raouf", lastName: "Rahiche", blocked: false),
    Client(firstName: "Zaki", lastName: "oun", blocked: true),
    Client(firstName: "oussama", lastName: "ali", blocked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Client>>(
          future: DBProvider.db.getAllClients(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Client>> snapshot,
          ) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Client item = snapshot.data[index];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10,5,10,0),
                      child: Card(
                        key: UniqueKey(),
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text(item.lastName),
                          subtitle: Text(item.id.toString()),
                          trailing: Text(item.lastName),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.pushNamed(context, formRoute);
        },
      ),
    );
  }
}
