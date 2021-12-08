import 'package:flutter/material.dart';
import 'package:test4/productspage.dart';

void main() => runApp(const MyApp());

class Assets {
  static Color primaryColor = const Color(0xFFAF2D3C);
  static Color secondaryColor = const Color(0xFF765656);
  static Color textColor = const Color(0xFF303030);
  static Color accentColor = const Color(0xFF765A2F);
  static Color backgroundColor = const Color(0xFFF1F3F6);
  static Color shadowColor = Colors.grey.shade400;
  static double roundCorners = 12;
  static String mainFont = 'Varela';
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
        backgroundColor: Assets.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                      'App Name',
                      style: TextStyle(
                        fontFamily: Assets.mainFont,
                        fontSize: 60,
                        color: Assets.backgroundColor,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height / 10, 0, 0),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(50,
                          MediaQuery.of(context).size.height * 3 / 10, 50, 0),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Assets.backgroundColor),
                            foregroundColor:
                                MaterialStateProperty.all(Assets.textColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.red.withOpacity(0.04);
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
                            ),
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
                            backgroundColor: MaterialStateProperty.all(
                                Assets.backgroundColor),
                            foregroundColor: MaterialStateProperty.all(
                              Assets.textColor,
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
                                  return Colors.red.withOpacity(0.04);
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
                            fontSize: 20
                        ),
                      )),
                ],
              ),
            ]),
          ),
        ));
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color passwordShadowColor = Assets.shadowColor;
  Color usernameShadowColor = Assets.shadowColor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Assets.backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontFamily: Assets.mainFont,
                            fontSize: 50,
                            color: Assets.textColor,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(50,
                            MediaQuery.of(context).size.height / 10, 50, 10),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50,
                            MediaQuery.of(context).size.height * 2 / 10, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: usernameShadowColor,
                              )
                            ]),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              usernameShadowColor =
                                  Assets.primaryColor.withOpacity(0.5);
                              passwordShadowColor = Assets.shadowColor;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners),
                                ),
                                borderSide: BorderSide(
                                  color: Assets.primaryColor,
                                  width: 0.01,
                                )),
                            filled: true,
                            fillColor: Assets.backgroundColor.withOpacity(0.9),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: passwordShadowColor,
                              )
                            ]),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              passwordShadowColor =
                                  Assets.primaryColor.withOpacity(0.5);
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners),
                                ),
                                borderSide: BorderSide(
                                  color: Assets.primaryColor,
                                  width: 0.01,
                                )),
                            filled: true,
                            fillColor: Assets.backgroundColor.withOpacity(0.9),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            ),
                          ),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Assets.primaryColor),
                                foregroundColor: MaterialStateProperty.all(
                                    Assets.backgroundColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Assets.roundCorners))),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return Colors.red.withOpacity(0.04);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return const Color(0xFFFFDADB).withOpacity(0.5);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const MainPage()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: Assets.mainFont,
                                ),
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              50,
                              MediaQuery.of(context).size.height * 0.5 / 10,
                              50,
                              0),
                          child: Text(
                            'App Name',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor),
                          )),
                    ],
                  ),
                ]),
              ),
            )));
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color passwordShadowColor = Assets.shadowColor;
  Color usernameShadowColor = Assets.shadowColor;
  Color emailShadowColor = Assets.shadowColor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Assets.backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Sign Up!',
                          style: TextStyle(
                            fontFamily: Assets.mainFont,
                            fontSize: 50,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(50,
                            MediaQuery.of(context).size.height / 10, 50, 10),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50,
                            MediaQuery.of(context).size.height * 2 / 10, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: usernameShadowColor,
                              )
                            ]),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              usernameShadowColor =
                                  Assets.primaryColor.withOpacity(0.5);
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor = Assets.shadowColor;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners),
                                ),
                                borderSide: BorderSide(
                                  color: Assets.primaryColor,
                                  width: 0.01,
                                )),
                            filled: true,
                            fillColor: Assets.backgroundColor.withOpacity(0.9),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: emailShadowColor,
                              )
                            ]),
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              emailShadowColor =
                                  Assets.primaryColor.withOpacity(0.5);
                              passwordShadowColor = Assets.shadowColor;
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners),
                                ),
                                borderSide: BorderSide(
                                  color: Assets.primaryColor,
                                  width: 0.01,
                                )),
                            filled: true,
                            fillColor: Assets.backgroundColor.withOpacity(0.9),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Assets.roundCorners)),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: passwordShadowColor,
                              )
                            ]),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              usernameShadowColor = Assets.shadowColor;
                              emailShadowColor = Assets.shadowColor;
                              passwordShadowColor =
                                  Assets.primaryColor.withOpacity(0.5);
                            });
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Assets.textColor,
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Assets.roundCorners),
                                ),
                                borderSide: BorderSide(
                                  color: Assets.primaryColor,
                                  width: 0.01,
                                )),
                            filled: true,
                            fillColor: Assets.backgroundColor.withOpacity(0.9),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: Assets.mainFont,
                              color: Assets.textColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Assets.roundCorners),
                            ),
                          ),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Assets.primaryColor),
                                foregroundColor: MaterialStateProperty.all(
                                    Assets.backgroundColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Assets.roundCorners))),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return Colors.red.withOpacity(0.04);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return const Color(0xFFFFDADB).withOpacity(0.3);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: Assets.mainFont,
                                ),
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              50,
                              MediaQuery.of(context).size.height * 0.4 / 10,
                              50,
                              0),
                          child: Text(
                            'App Name',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: Assets.mainFont,
                                color: Assets.textColor),
                          )),
                    ],
                  ),
                ]),
              ),
            )));
  }
}
