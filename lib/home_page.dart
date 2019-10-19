import 'package:flutter/material.dart';

import './custom_steppers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas contas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, CustomSteppers.routeName);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Cliente ${index + 1}'),
            subtitle: Text('Tipo de conta ${index + 1}'),
            trailing: Text('${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, CustomSteppers.routeName);
        },
        label: Text('Contas'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
