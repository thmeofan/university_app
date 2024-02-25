import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/consts/app_text_styles/constructor_text_style.dart';
import 'package:university_app/views/app/widgets/chosen_action_button_widget.dart';
import 'package:university_app/views/constructor/view/specielties.dart';
import '../../../consts/app_colors.dart';
import '../../../data/model/university_info.dart';

class ProsAndConsScreen extends StatefulWidget {
  final UniversityInfo universityInfo;

  ProsAndConsScreen({required this.universityInfo});

  @override
  _ProsAndConsScreenState createState() => _ProsAndConsScreenState();
}

class _ProsAndConsScreenState extends State<ProsAndConsScreen> {
  List<TextEditingController> _prosControllers = [TextEditingController()];
  List<TextEditingController> _consControllers = [TextEditingController()];

  void _addNewProConField(List<TextEditingController> controllers) {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int numberOfTextFields = _prosControllers.length + _consControllers.length;
    double spacerHeight =
        size.height * 0.55 - (numberOfTextFields * size.height * 0.1);
    if (spacerHeight < 0) {
      spacerHeight = 0;
    }
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
      body: Padding(
        padding: EdgeInsets.only(
          bottom: size.height * 0.015,
        ),
        child: Container(
          color: AppColors.lightGreyColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.015,
                    left: size.width * 0.025,
                    right: size.width * 0.025,
                    bottom: size.height * 0.015,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Nueva universidad',
                              style: ConstructorTextStyle.title,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              'Ventajas',
                              style: ConstructorTextStyle.lable,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () =>
                                  _addNewProConField(_prosControllers),
                              child: Text(
                                'Agregar',
                                style: ConstructorTextStyle.add,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                          ],
                        ),
                        for (var controller in _prosControllers)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.015,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                style: ConstructorTextStyle.inputText,
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Nombre del beneficio',
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
                          ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              'Contras',
                              style: ConstructorTextStyle.lable,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () =>
                                  _addNewProConField(_consControllers),
                              child: Text(
                                'Agregar',
                                style: ConstructorTextStyle.add,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                          ],
                        ),
                        for (var controller in _consControllers)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.015,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                style: ConstructorTextStyle.inputText,
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Nombre de contras',
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
                          ),
                        Container(
                          height: spacerHeight,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.025,
                          ),
                          child: ChosenActionButton(
                            text: 'Próximo',
                            onTap: () {
                              widget.universityInfo.pros =
                                  _prosControllers.map((c) => c.text).toList();
                              widget.universityInfo.cons =
                                  _consControllers.map((c) => c.text).toList();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpecialtiesScreen(
                                    universityInfo: widget.universityInfo,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
