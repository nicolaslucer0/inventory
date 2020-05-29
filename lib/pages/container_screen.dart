import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:inventory/database/database.dart';
import 'package:inventory/models/ContainerModel.dart';

import 'package:inventory/routes.dart';
import 'package:inventory/widgets/speddial.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerModelScreenState createState() => _ContainerModelScreenState();
}

class _ContainerModelScreenState extends State<ContainerScreen> {
  List<ContainerModel> testContainerModels = [
    ContainerModel(name: "Raouf", description: "Rahiche"),
    ContainerModel(name: "Zaki", description: "oun"),
    ContainerModel(name: "oussama", description: "ali"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<ContainerModel>>(
            future: DBProvider.db.getAllContainerModels(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<ContainerModel>> snapshot,
            ) {
              if (snapshot.hasData) {
                return Stack(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Buscar contenedores",
                        suffixIcon: Icon(Icons.search),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black12,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        ContainerModel item = snapshot.data[index];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: Card(
                            key: UniqueKey(),
                            child: ListTile(
                              leading: CircleAvatar(),
                              title: Text(item.name),
                              subtitle: Text(item.id.toString()),
                              trailing: Text(item.description),
                            ),
                          ),
                        );
                      }),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: MainSpeedDial());
  }
}
