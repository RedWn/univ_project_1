import 'package:flutter/material.dart';
import 'package:univ_project_1/login.dart';
import 'package:univ_project_1/signup.dart';

void main() => runApp(const MyApp());

class Assets {
  static bool darkMode = false;
  static Color primaryColor = const Color(0xFF6750a4);
  static Color secondaryColor = const Color(0xFF765656);
  static Color textColor = const Color(0xFF303030);
  static Color accentColor = const Color(0xFF765A2F);
  static Color backgroundColor = const Color(0xFFF1F3F6);
  static Color lightTextColor = const Color(0xFFF1F3F6);
  static Color tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  static Color errorShadowColor = Colors.red.shade400;
  static Color shadowColor = Colors.grey.shade400;
  static double roundCorners = 12;
  static String mainFont = 'Varela';
  static bool rtl = false;
  static String link = "http://10.0.2.2:8000/api/";
  static String link2 =
      "https://410c09a9-1200-4123-baa1-53834038eac7.mock.pstmn.io/register";

  static TextDirection rtlState() {
    if (rtl) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  static void enableDarkMode() {
    primaryColor = const Color(0xFFAF2D3C);
    secondaryColor = const Color(0xFF765656);
    textColor = const Color(0xFFF1F3F6);
    accentColor = const Color(0xFF765A2F);
    backgroundColor = const Color(0xFF303030);
    shadowColor = Colors.grey.shade800;
    tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  }

  static void disableDarkMode() {
    primaryColor = const Color(0xFFAF2D3C);
    secondaryColor = const Color(0xFF765656);
    textColor = const Color(0xFF303030);
    accentColor = const Color(0xFF765A2F);
    backgroundColor = const Color(0xFFF1F3F6);
    shadowColor = Colors.grey.shade400;
    tappedShadowColor = Assets.primaryColor.withOpacity(0.5);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RedApp(),
    );
  }
}

class RedApp extends StatelessWidget {
  const RedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Assets.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 50),
                    child: Image.asset('Assets/Icon.png'),
                  ),
                  Container(
                    child: Text(
                      'App Pharma',
                      style: TextStyle(
                        fontFamily: Assets.mainFont,
                        fontSize: 60,
                        color: Assets.textColor,
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          50, MediaQuery.of(context).size.height / 10, 50, 0),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Assets.primaryColor),
                            foregroundColor:
                                MaterialStateProperty.all(Assets.textColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(//RedWn was here
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.deepPurple.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return const Color(0xFFFFDADB);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                                color: Assets.backgroundColor),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Assets.primaryColor),
                            foregroundColor: MaterialStateProperty.all(
                              Assets.backgroundColor,
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            shadowColor: MaterialStateProperty.all(
                                const Color(0xFF000000)),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.deepPurple.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return const Color(0xFFFFDADB);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUp()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: Assets.mainFont,
                            ),
                          ))),
                  Container(
                      margin: EdgeInsets.fromLTRB(50,
                          MediaQuery.of(context).size.height * 2 / 10, 50, 0),
                      child: Text(
                        'Team Names',
                        style: TextStyle(
                            fontFamily: Assets.mainFont,
                            color: Assets.backgroundColor,
                            fontSize: 20),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}
