import 'package:flutter/material.dart';
import 'package:inventory/database/database.dart';
import 'dart:math' as math;
import 'models/ContainerModel.dart';

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
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      DBProvider.db.deleteClient(item.id);
                    },
                    child: ListTile(
                      title: Text(item.lastName),
                      leading: Text(item.id.toString()),
                      trailing: Checkbox(
                        onChanged: (bool value) {
                          DBProvider.db.blockOrUnblock(item);
                          setState(() {});
                        },
                        value: item.blocked,
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Client rnd = testClients[math.Random().nextInt(testClients.length)];
          await DBProvider.db.newClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}
