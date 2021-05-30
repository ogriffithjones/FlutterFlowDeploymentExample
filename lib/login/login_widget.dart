import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../sign_up/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Image.network(
              'https://picsum.photos/seed/484/300',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: 0,
                    height: 0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 60, 0, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: emailTextController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF455A64),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF455A64),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 20),
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: passwordTextController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF455A64),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF455A64),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final user = await signInWithEmail(
                                    context,
                                    emailTextController.text,
                                    passwordTextController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Sign in',
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 50,
                                  color: Color(0xFF0F2A58),
                                  textStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFFDEDEDE),
                                    fontSize: 16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: 25,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Text(
                                    'Don\'t have an account?',
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFFADADAD),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment(0, -0.65),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
