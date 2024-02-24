import 'package:flutter/material.dart';

import '../../../data/model/university_info.dart';
import '../../../util/shared_pref_service.dart';
import '../widget/specielty_widget.dart';

class SpecialtiesScreen extends StatefulWidget {
  @override
  _SpecialtiesScreenState createState() => _SpecialtiesScreenState();
}

class _SpecialtiesScreenState extends State<SpecialtiesScreen> {
  List<Specialty> _specialties = [Specialty(name: '', priority: 0)];

  void _addNewSpecialty() {
    setState(() {
      _specialties.add(Specialty(name: '', priority: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialties'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _specialties.length,
                itemBuilder: (context, index) {
                  return SpecialtyWidget(
                    specialty: _specialties[index],
                    onChanged: (specialty) {
                      _specialties[index] = specialty;
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                // Here you would collect the specialties data and add it to universityInfo.specialties
                // Finally, save all the university info to SharedPreferences
                await SharedPreferencesService.saveUniversityInfo(
                    widget.universityInfo);
                widget.onFinished();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleFinish() async {
    // Save to SharedPreferences
    await SharedPreferencesService.saveUniversityInfo(widget.universityInfo);
    widget
        .onFinished(); // This will be used to navigate back to the main screen
  }
}
