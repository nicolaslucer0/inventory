import 'package:flutter/material.dart';

// Create a Form widget.
class ContainerForm extends StatefulWidget {
  @override
  ContainerFormState createState() {
    return ContainerFormState();
  }
}

class ContainerFormState extends State<ContainerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.teal,
                Colors.blue,
              ],
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Crear un nuevo contenedor',
                style: new TextStyle(color: Colors.black, fontSize: 25.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nombre de contenedor",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Email cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // Client rnd = testClients[math.Random().nextInt(testClients.length)];
                      // await DBProvider.db.newClient(rnd);
                      // setState(() {});
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
