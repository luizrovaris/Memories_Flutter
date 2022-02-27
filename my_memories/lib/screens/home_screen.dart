import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Memories'),
        actions: [
          IconButton(onPressed: () => print('Add'), icon: Icon(Icons.add_a_photo))
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, _) {
          return const Card(
            elevation: 5,
            child: ListTile(
              title: Text('Address'),
              subtitle: Text('Description'),
              //leading: ,
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 0,
      ),
    );
  }
}