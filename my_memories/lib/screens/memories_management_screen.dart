import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:my_memories/models/memory.dart';

class MemoriesManagementScreen extends StatefulWidget {
  const MemoriesManagementScreen({Key? key}) : super(key: key);
  static const String route = 'memories-management';

  @override
  _MemoriesManagementScreenState createState() =>
      _MemoriesManagementScreenState();
}

class _MemoriesManagementScreenState extends State<MemoriesManagementScreen> {
  var _descriptionController = TextEditingController();
  var _memory = Memory();
  final _imagePicker = ImagePicker();

  Future<void> captureImage() async {
    final imageFile = await _imagePicker.getImage(source: ImageSource.camera);

    _memory.image = imageFile?.path;

    setState(() {
      _memory = _memory;
    });
  }

  Future<void> _getLocation() async {
    Location location = Location();

    LocationData locationData = await location.getLocation();
    print(locationData);
  }

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
                child: _memory.image != null
                    ? GestureDetector(
                      onTap: captureImage,
                      child: Image.file(
                          File(_memory.image!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                    )
                    : IconButton(
                        onPressed: captureImage,
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
                  onPressed: _getLocation,
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
