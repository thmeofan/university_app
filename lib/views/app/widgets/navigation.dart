import 'package:flutter/material.dart';
import '../../../data/model/university_info.dart';
import '../../../util/shared_pref_service.dart';
import '../../constructor/view/basic_info.dart';
import '../../constructor/view/pros_and_cons.dart';
import '../../constructor/view/specielties.dart';

class NavigationControlWidget extends StatefulWidget {
  @override
  _NavigationControlWidgetState createState() =>
      _NavigationControlWidgetState();
}

class _NavigationControlWidgetState extends State<NavigationControlWidget> {
  late UniversityInfo universityInfo;

  @override
  void initState() {
    super.initState();
    universityInfo = UniversityInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('University Constructor')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => navigateToUniversityInfoScreen(context),
          child: Text('Start University Constructor'),
        ),
      ),
    );
  }

  void navigateToUniversityInfoScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UniversityInfoScreen(
          onSave: (UniversityInfo uniInfo) {
            universityInfo =
                uniInfo; // Update the global universityInfo object with the data from the first screen
            navigateToProsAndConsScreen(context);
          },
        ),
      ),
    );
  }

  void navigateToProsAndConsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProsAndConsScreen(
          universityInfo: universityInfo,
          onSave: (UniversityInfo updatedUniInfo) {
            universityInfo =
                updatedUniInfo; // Update the university info with the data from screen 2
            navigateToSpecialtiesScreen(context);
          },
        ),
      ),
    );
  }

  void navigateToSpecialtiesScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SpecialtiesScreen(
          universityInfo: universityInfo,
          onFinished: () async {
            // Save all the university info to SharedPreferences
            await SharedPreferencesService.saveUniversityInfo(universityInfo);
            Navigator.popUntil(context,
                (route) => route.isFirst); // Go back to the first screen
          },
        ),
      ),
    );
  }
}
