import 'package:flutter/material.dart';
import 'package:university_app/consts/app_colors.dart';
import 'package:university_app/consts/app_text_styles/constructor_text_style.dart';

class SpecialtyPriority extends StatefulWidget {
  final Function(int priority) onPriorityChanged;

  SpecialtyPriority({required this.onPriorityChanged});

  @override
  _SpecialtyPriorityState createState() => _SpecialtyPriorityState();
}

class _SpecialtyPriorityState extends State<SpecialtyPriority> {
  int _priority = 0;

  void _setPriority(int newPriority) {
    setState(() {
      _priority = newPriority;
    });
    widget.onPriorityChanged(_priority);
  }

  @override
  Widget build(BuildContext context) {
    List<String> priorityTexts = ['Primero', 'Segundo', 'Tercero'];
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 1; i <= 3; i++)
          GestureDetector(
            onTap: () => _setPriority(i),
            child: Container(
              height: size.height * 0.074,
              width: size.width * 0.27,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: _priority == i
                    ? AppColors.orangeColor
                    : AppColors.lightGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  priorityTexts[i - 1],
                  style: ConstructorTextStyle.priority,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
