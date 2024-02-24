import 'package:flutter/material.dart';

class SpecialtyWidget extends StatelessWidget {
  final Specialty specialty;
  final Function(Specialty) onChanged;

  SpecialtyWidget({required this.specialty, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              onChanged(Specialty(name: value, priority: specialty.priority));
            },
            decoration: InputDecoration(
              labelText: 'Specialty Name',
            ),
          ),
          // Add your priority buttons or other UI elements here
          // ...
        ],
      ),
    );
  }
}
