import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/consts/app_text_styles/full_info_text_style.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../data/model/university_info.dart';

class FullInfoScreen extends StatelessWidget {
  final UniversityInfo universityInfo;

  FullInfoScreen({required this.universityInfo});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          padding: EdgeInsets.all(
            size.width * 0.02,
          ),
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.01,
                ),
                child: Container(
                  width: size.width * 0.88,
                  height: size.height * 0.25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.bluishGreenColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      size.width * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/hat.svg'),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          universityInfo.name,
                          style: FullInfoTextStyle.uniName,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          universityInfo.address,
                          style: FullInfoTextStyle.address,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < universityInfo.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: index < universityInfo.rating
                                  ? Colors.yellow
                                  : Colors.grey,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  size.width * 0.02,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Ventajas',
                        textAlign: TextAlign.start,
                        style: FullInfoTextStyle.subtitle,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      for (String pro in universityInfo.pros)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.005,
                          ),
                          child: Container(
                              height: size.height * 0.075,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.height * 0.01,
                                    ),
                                    child: Text(
                                      '$pro',
                                      style: FullInfoTextStyle.tile,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Contras',
                        textAlign: TextAlign.start,
                        style: FullInfoTextStyle.subtitle,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      for (String con in universityInfo.cons)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.005,
                          ),
                          child: Container(
                              height: size.height * 0.075,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.height * 0.01,
                                    ),
                                    child: Text(
                                      '$con',
                                      style: FullInfoTextStyle.tile,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Especialidades',
                        style: FullInfoTextStyle.subtitle,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Container(
                        height: size.height * 0.075,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            const Text(
                              'Tasas de matrícula ',
                              style: FullInfoTextStyle.tileSubtitle,
                            ),
                            Spacer(),
                            Text(
                              ' ${universityInfo.cost}',
                              style: FullInfoTextStyle.tileSubtitle,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Container(
                          height: size.height * 0.075,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              const Text(
                                'Periodo di addestramento',
                                style: FullInfoTextStyle.tileSubtitle,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Spacer(),
                              Text(
                                ' ${universityInfo.duration}',
                                style: FullInfoTextStyle.tileSubtitle,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
