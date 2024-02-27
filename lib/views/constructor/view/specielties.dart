import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/consts/app_colors.dart';
import 'package:university_app/views/constructor/view/cost_and_duration.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/university_info.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widget/specielty_widget.dart';

class SpecialtiesScreen extends StatefulWidget {
  final UniversityInfo universityInfo;

  SpecialtiesScreen({required this.universityInfo});

  @override
  _SpecialtiesScreenState createState() => _SpecialtiesScreenState();
}

class _SpecialtiesScreenState extends State<SpecialtiesScreen> {
  List<Specialty> _specialties = [];

  void _addSpecialty(Specialty specialty) {
    setState(() {
      _specialties.add(specialty);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.only(
            top: size.height * 0.015,
            left: size.width * 0.025,
            right: size.width * 0.025,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Nueva universidad',
                style: ConstructorTextStyle.title,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SpecialtyWidget(
                onSpecialtyAdded: _addSpecialty,
              ),
              ..._specialties.map(
                (s) => ListTile(
                  title: Text(
                    s.name,
                    style: ConstructorTextStyle.inputText,
                  ),
                  trailing: Text(
                    'Priority: ${s.priority}',
                    style: ConstructorTextStyle.hintText,
                  ),
                ),
              ),
              Spacer(),
              ChosenActionButton(
                text: 'Próximo',
                onTap: () {
                  if (_specialties.isNotEmpty) {
                    widget.universityInfo.specialties = _specialties;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CostAndDurationScreen(
                          universityInfo: widget.universityInfo,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Agregue al menos una especialidad antes de continuar.',
                          style: ConstructorTextStyle.snackBar,
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.lightGreyColor,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
