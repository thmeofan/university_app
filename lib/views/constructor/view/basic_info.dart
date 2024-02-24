import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/views/constructor/view/pros_and_cons.dart';

import '../../../data/model/university_info.dart';
import '../widget/rating_widget.dart';

class UniversityInfoScreen extends StatefulWidget {
  @override
  _UniversityInfoScreenState createState() => _UniversityInfoScreenState();
}

class _UniversityInfoScreenState extends State<UniversityInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 20),
            Text('Rate the University:'),
            StarRatingWidget(
              rating: _rating,
              onRatingChanged: (rating) => setState(() => _rating = rating),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                final universityInfo = UniversityInfo(
                  name: _nameController.text,
                  address: _addressController.text,
                  description: _descriptionController.text,
                  rating: _rating,
                  pros: [], // Initialize empty pros list
                  cons: [], // Initialize empty cons list
                  specialties: [], // Initialize empty specialties list
                );
                widget.onSave(universityInfo);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSave() {
    UniversityInfo uniInfo = UniversityInfo(
      name: _nameController.text,
      address: _addressController.text,
      description: _descriptionController.text,
      rating: _rating,
      pros: [], // Initialize with empty pros list
      cons: [], // Initialize with empty cons list
      specialties: [], // Initialize with empty specialties list
    );
    widget.onSave(uniInfo);
  }
}
