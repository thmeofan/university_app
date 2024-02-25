import 'package:flutter/material.dart';

import '../../../data/model/university_info.dart';

class FullInfoScreen extends StatelessWidget {
  final UniversityInfo universityInfo;

  FullInfoScreen({required this.universityInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${universityInfo.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Address: ${universityInfo.address}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Description: ${universityInfo.description}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Rating: ${universityInfo.rating}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Pros:', style: TextStyle(fontSize: 16)),
            for (String pro in universityInfo.pros) Text('• $pro'),
            SizedBox(height: 20),
            Text('Cons:', style: TextStyle(fontSize: 16)),
            for (String con in universityInfo.cons) Text('• $con'),
            SizedBox(height: 20),
            Text('Specialties:', style: TextStyle(fontSize: 16)),
            for (Specialty specialty in universityInfo.specialties)
              Text('• ${specialty.name} - Priority: ${specialty.priority}'),
            Text('Cost: ${universityInfo.cost}',
                style: TextStyle(fontSize: 16)),
            Text('Duration: ${universityInfo.duration}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
