import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/quiz_text_style.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../util/app_routes.dart';
import '../../../util/shared_pref_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showNews = true;
  List<Map<String, dynamic>> operations = [];
  double totalIncome = 0.0;

  @override
  void initState() {
    super.initState();
    _loadOperations();
    _setupBackListener();
  }

  Future<void> _loadOperations() async {
    operations = await SharedPreferencesService.loadOperations();
    totalIncome = _calculateTotalIncome();
    setState(() {});
  }

  double _calculateTotalIncome() {
    return operations.fold(0, (sum, op) => sum + (op['amount'] as double));
  }

  void _updateOperations() {
    setState(() {
      //  operations = SharedPreferencesService.loadOperations();
      totalIncome = _calculateTotalIncome();
    });
  }

  void _setupBackListener() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ModalRoute.of(context)!.addScopedWillPopCallback(() async {
        _loadOperations();
        return true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightGreyColor,
        elevation: 0,
        title: const Text(
          'Good morning',
          style: SynopsisTextStyle.appbar,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.profile,
              );
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadOperations,
        child: Container(
          color: AppColors.lightGreyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.005,
                  horizontal: screenSize.width * 0.03,
                ),
                child: Text(
                  'Income',
                  style: SynopsisTextStyle.title,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.11,
                child: operations.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.03,
                          ),
                          child: Text(
                            'No income info yet, click on the Personal Income widget to add information. Or pull the screen to refresh it if you already added information',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: operations.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.005,
                              horizontal: screenSize.width * 0.02,
                            ),
                            child: Container(
                              width: screenSize.width * 0.3,
                              padding: EdgeInsets.symmetric(
                                vertical: screenSize.width * 0.005,
                                horizontal: screenSize.width * 0.02,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    operations[index]['description'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${operations[index]['amount'].toStringAsFixed(0)} \$',
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.012,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSwitchButton('News', true),
                    _buildSwitchButton('Quiz', false),
                  ],
                ),
              ),
              Expanded(
                child: showNews
                    ? Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenSize.height * 0.01,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '8 news',
                                    style: QuizTextStyle.dates,
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             NewsScreen(
                                        //                 newsModel: news)));
                                      },
                                      child: const Text('View all',
                                          style: SynopsisTextStyle.appbar))
                                ],
                              ),
                            ),
                            // Expanded(
                            //   // child: ListView.builder(
                            //   //   itemCount: widget.newsModel.length,
                            //   //   itemBuilder: (BuildContext context, int index) {
                            //   //     return NewsItemWidget(
                            //   //         newsModel: widget.newsModel[index]);
                            //   //   },
                            //   // ),
                            // ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.height * 0.01,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '2 themes',
                                        style: QuizTextStyle.dates,
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          // Navigator.of(context)
                                          //     .push(MaterialPageRoute(
                                          //   builder: (context) =>
                                          //       QuizScreen(quizzes: quiz),
                                          // ));
                                        },
                                        child: const Text('View all',
                                            style: SynopsisTextStyle.appbar),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      buildCard(
                                          screenSize,
                                          'Additional features and improvements',
                                          '17 february 2024'),
                                      SizedBox(
                                          height: screenSize.height * 0.01),
                                      buildCard(
                                          screenSize,
                                          'Convenience of using the mobile banking application',
                                          '18 february 2024'),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size screenSize, String text, String date) {
    return Container(
      height: screenSize.height * 0.17,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: screenSize.width * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.lightGreyColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: QuizTextStyle.theme,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 35,
                    child: Stack(
                      children: <Widget>[
                        for (int i = 1; i <= 5; i++)
                          Positioned(
                            left: i * 25.0,
                            child: Image.asset('assets/images/avatar$i.png',
                                width: 35),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.005),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(date, style: QuizTextStyle.date),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchButton(String title, bool isNews) {
    Color selectedColor = Colors.white;
    Color unselectedColor = AppColors.lightGreyColor;
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        // vertical: screenSize.height * 0.012,
        horizontal: screenSize.width * 0.02,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            showNews = isNews;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.012,
            horizontal: screenSize.width * 0.05,
          ),
          decoration: BoxDecoration(
            color:
                showNews == isNews ? AppColors.bluishGreenColor : Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                showNews == isNews
                    ? 'assets/icons/news_icon.svg'
                    : 'assets/icons/quiz_icon.svg',
                color: showNews == isNews ? selectedColor : unselectedColor,
              ),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(
                  color: showNews == isNews ? selectedColor : unselectedColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
