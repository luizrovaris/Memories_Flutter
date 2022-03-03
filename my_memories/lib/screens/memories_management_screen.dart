import 'package:flutter/material.dart';

class MemoriesManagementScreen extends StatefulWidget {
  const MemoriesManagementScreen({Key? key}) : super(key: key);
  static const String route = 'memories-management';

  @override
  _MemoriesManagementScreenState createState() => _MemoriesManagementScreenState();
}

class _MemoriesManagementScreenState extends State<MemoriesManagementScreen> {
  var _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Memories Management'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height / 3,
              color: Colors.black12,
              child: Center(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 70,
                ),
              ),
            ), 
            Divider(),           
            Container(
              height: mediaQuery.size.height / 3,
              color: Colors.black12,
              child: Center(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_location),
                  iconSize: 70,
                ),
              ),
            ),
            Divider(),
            TextFormField(
              controller: _descriptionController,
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Tell me about your memory.',
              ),
            )
          ],
        ),
      ),
    );
  }
}
