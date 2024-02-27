import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/consts/app_text_styles/constructor_text_style.dart';
import 'package:university_app/views/app/widgets/chosen_action_button_widget.dart';
import 'package:university_app/views/constructor/view/pros_and_cons.dart';

import '../../../consts/app_colors.dart';
import '../../../data/model/university_info.dart';
import '../widget/rating_widget.dart';

class BasicInfoScreen extends StatefulWidget {
  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _rating = 0;

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
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextField(
                  style: ConstructorTextStyle.inputText,
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Nombre de la Universidad',
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
                height: size.height * 0.02,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextField(
                  style: ConstructorTextStyle.inputText,
                  controller: _addressController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Ubicación de la Universidad',
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
                height: size.height * 0.02,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                height: size.height * 0.25,
                child: TextField(
                  controller: _descriptionController,
                  style: ConstructorTextStyle.inputText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Descripción de la Universidad',
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
                height: size.height * 0.02,
              ),
              Text(
                'Calificación de reseñas universitarias.',
                style: ConstructorTextStyle.rating,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              StarRating(
                rating: _rating,
                onRatingChanged: (rating) => setState(() => _rating = rating),
              ),
              Spacer(),
              ChosenActionButton(
                  text: 'Próximo',
                  onTap: () {
                    if (_nameController.text.isNotEmpty &&
                        _addressController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty &&
                        _rating > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProsAndConsScreen(
                            universityInfo: UniversityInfo(
                              name: _nameController.text,
                              address: _addressController.text,
                              description: _descriptionController.text,
                              rating: _rating,
                            ),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Por favor complete todos los campos antes de continuar.',
                            style: ConstructorTextStyle.snackBar,
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: AppColors.lightGreyColor,
                        ),
                      );
                    }
                  }),
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
