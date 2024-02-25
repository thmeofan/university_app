import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/views/settings/widgets/settings_widget.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../app/views/my_in_app_web_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        elevation: 0,
        // title: const Text(
        //   'Settings',
        //   style: SynopsisTextStyle.appbar,
        // ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.12,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.015),
                child: const Text('Ajustes'),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Compartir con amigos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyInAppWebView(url: 'https://google.com/'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Política de privacidad',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyInAppWebView(url: 'https://google.com/'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Condiciones de uso',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyInAppWebView(url: 'https://google.com/'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
