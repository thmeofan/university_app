import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/consts/app_text_styles/full_info_text_style.dart';
import 'package:university_app/util/app_routes.dart';
import 'package:university_app/views/app/widgets/chosen_action_button_widget.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/university_info.dart';
import '../../../util/shared_pref_service.dart'; // Replace with your actual file path

class CostAndDurationScreen extends StatefulWidget {
  final UniversityInfo universityInfo;

  CostAndDurationScreen({super.key, required this.universityInfo});

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
    Size size = MediaQuery.of(context).size;
    List<Specialty> specialties = widget.universityInfo.specialties;
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
              const Text(
                'Nueva universidad',
                style: ConstructorTextStyle.title,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text('Especialidades'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColors.bluishGreenColor),
                  color: Colors.white,
                ),
                height: size.height * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.015),
                      child: SvgPicture.asset('assets/icons/hat.svg'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.005),
                      child: Text(
                        'Inserisci il costo approssimativo e la durata dello studio',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: FullInfoTextStyle.uniNameFOrBaner,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextField(
                  style: ConstructorTextStyle.inputText,
                  controller: _costController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Tasas de matrícula',
                    labelStyle: ConstructorTextStyle.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextField(
                  style: ConstructorTextStyle.inputText,
                  controller: _durationController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Periodo di addestramento',
                    labelStyle: ConstructorTextStyle.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Spacer(),
              ChosenActionButton(
                text: 'Hecho',
                onTap: () async {
                  widget.universityInfo.cost = _costController.text;
                  widget.universityInfo.duration = _durationController.text;
                  List<UniversityInfo> universityList =
                      await UniversityPreferences().loadUniversityList();
                  universityList.add(widget.universityInfo);
                  await UniversityPreferences()
                      .saveUniversityList(universityList);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.home, (Route<dynamic> route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
