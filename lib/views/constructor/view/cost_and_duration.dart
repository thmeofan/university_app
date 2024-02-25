import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/util/app_routes.dart';
import 'package:university_app/views/constructor/view/specielties.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/university_info.dart';
import '../../../util/shared_pref_service.dart'; // Replace with your actual file path

class CostAndDurationScreen extends StatefulWidget {
  final UniversityInfo universityInfo;

  CostAndDurationScreen({required this.universityInfo});

  @override
  _CostAndDurationScreenState createState() => _CostAndDurationScreenState();
}

class _CostAndDurationScreenState extends State<CostAndDurationScreen> {
  final _costController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void dispose() {
    _costController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        title: const Text(
          'Atrás',
          style: ConstructorTextStyle.appBar,
        ),
        titleSpacing: -5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/leading.svg'),
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _costController,
                decoration: InputDecoration(labelText: 'Cost of Study'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              TextField(
                controller: _durationController,
                decoration:
                    InputDecoration(labelText: 'Duration of Study (years)'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Update the universityInfo object with cost and duration
                  widget.universityInfo.cost = _costController.text;
                  widget.universityInfo.duration = _durationController.text;

                  // Save the updated list of universities
                  List<UniversityInfo> universityList =
                      await UniversityPreferences().loadUniversityList();
                  universityList.add(widget.universityInfo);
                  await UniversityPreferences()
                      .saveUniversityList(universityList);

                  // Navigate back to the HomeScreen
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.home, (Route<dynamic> route) => false);
                },
                child: Text('Save and Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
