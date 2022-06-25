import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  List<String> newTextField = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'First Text field',
                          ),
                        ),
                      ),
                    ),

                    ///Adding a new textfield
                    IconButton(
                      onPressed: () {
                        setState(() {
                          newTextField.add('');
                        });
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                    )
                  ],
                ),

                ///added text fields
                ...getNewTextFormFields(),

                ///Button to print the values
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    //the valued are displayed in the list
                    print(newTextField);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Generating new textform if add button is clicked
  List<Widget> getNewTextFormFields() {
    var textField = <Widget>[];
    for (var i = 0; i < newTextField.length; i++) {
      textField.add(
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      newTextField[i] = value;
                    });
                  },
                  validator: (value) {
                    return "slkdfjlksd";
                  },
                  decoration: InputDecoration(
                    hintText: '${i + 1} Text field',
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  newTextField.removeAt(i);
                });
              },
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
                size: 30,
              ),
            )
          ],
        ),
      );
    }
    return textField;
  }
}
