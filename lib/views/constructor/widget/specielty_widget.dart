import 'package:flutter/material.dart';
import 'package:university_app/consts/app_colors.dart';
import 'package:university_app/views/constructor/widget/specialty_priority_widget.dart';

import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/university_info.dart';

class SpecialtyWidget extends StatefulWidget {
  final Function(Specialty) onSpecialtyAdded;

  SpecialtyWidget({required this.onSpecialtyAdded});

  @override
  _SpecialtyWidgetState createState() => _SpecialtyWidgetState();
}

class _SpecialtyWidgetState extends State<SpecialtyWidget> {
  final TextEditingController _controller = TextEditingController();
  int _priority = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
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
                  onPressed: () {
                    final specialty =
                        Specialty(name: _controller.text, priority: _priority);
                    widget.onSpecialtyAdded(specialty);
                    _controller.clear();
                    setState(() {
                      _priority = 0;
                    });
                  },
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
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              color: AppColors.lightGreyColor,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Nombre de la especialización',
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
            SpecialtyPriority(
              onPriorityChanged: (priority) {
                _priority = priority;
              },
            ),
          ],
        ),
      ),
    );
  }
}
