import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widgets/introduction_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  void _onActionButtonTap() {
    if (_current == 0) {
      _carouselController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      context.read<OnboardingCubit>().setFirstTime();
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //  extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Image.asset('assets/images/uni.png'),
        titleSpacing: -5,
        title: const Text(
          'CounselUni',
          style: OnboardingTextStyle.screenTitle,
        ),
      ),
      body: Container(
        // color: AppColors.blackColor,
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: const [
                  IntroductionWidget(
                    imagePath: 'assets/images/onboarding1.png',
                  ),
                  IntroductionWidget(
                    imagePath: 'assets/images/onboarding2.png',
                  ),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height * 0.6,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  //   color: AppColors.blackColor,
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              width: double.infinity,
              height: size.height * 0.5,
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            _current == 0
                                ? 'Agregue instituciones educativas relevantes.'
                                : 'Elige la universidad más adecuada',
                            style: OnboardingTextStyle.introduction,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Flexible(
                        child: Text(
                          _current == 0
                              ? 'Añade las universidades a las que estás interesado en postular y resalta información básica sobre ellas.'
                              : 'Estudia las condiciones de todas las universidades y elige la opción que más te convenga.',
                          style: OnboardingTextStyle.description,
                        ),
                      ),
                    ]),
                    const Spacer(),
                    ChosenActionButton(
                      onTap: _onActionButtonTap,
                      text: 'Empezar',
                    ),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
