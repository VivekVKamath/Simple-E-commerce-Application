import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/landing_pages/login_page.dart';
import 'package:ffgame4/ui/landing_pages/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  var buttonblue = COLORS.blueSecondary;
  bool isEmp = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.blockWidth * 4),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: COLORS.accentDark,
                        fontWeight: FontWeight.w700,
                        fontFamily: "NunitoSans",
                        fontSize: SizeConfig.blockHeight * 3),
                  ),
                  SizedBox(
                    width: SizeConfig.blockWidth * 2,
                  ),
                  Icon(
                    Icons.logout,
                    color: COLORS.accentDark,
                    size: SizeConfig.blockWidth * 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 6,
                  vertical: SizeConfig.blockHeight * 4),
              child: Column(
                children: [
                  ///Register user
                  titletext(
                      text: "Register user",
                      subtext: "Enter the details to register."),
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),

                  ///Qualification
                  imptext(mtext: "Qualification"),
                  SizedBox(
                    height: SizeConfig.blockHeight,
                  ),

                  ///TFF for qualification
                  formfield(
                      control: controller,
                      hinttext: "Enter your qualification",
                      keyboardt: TextInputType.text,
                      valid: (value) {
                        if (value!.contains(" ")) {
                          return "Wrong Information";
                        } else if (value.isEmpty) {
                          return "Wrong Information";
                        } else if (!RegExp(r'^[a-zA-Z0-9&%=]+$')
                            .hasMatch(value)) {
                          return "Wrong Information";
                        }
                        return null;
                      },
                      func: (value) {
                        if (value.isEmpty) {
                          isEmp = true;
                        } else {
                          isEmp = false;
                        }
                        setState(() {
                          if (value == value) {
                            buttonblue = COLORS.accent;
                          } else if (controller.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          } else {
                            buttonblue = COLORS.accent;
                          }
                        });
                      }),

                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),

                  ///Register Number
                  imptext(mtext: "Register Number"),
                  SizedBox(
                    height: SizeConfig.blockHeight,
                  ),

                  ///TFF for register Number
                  formfield(
                      control: controller1,
                      hinttext: "Enter your register number",
                      keyboardt: TextInputType.text,
                      valid: (value) {
                        if (value!.contains(" ")) {
                          return "Wrong Information";
                        } else if (value.isEmpty) {
                          return "Wrong Information";
                        } else if (!RegExp(r'^[a-zA-Z0-9&%=]+$')
                            .hasMatch(value)) {
                          return "Wrong Information";
                        }
                        return null;
                      },
                      func: (value) {
                        if (value.isEmpty) {
                          isEmp = true;
                        } else {
                          isEmp = false;
                        }
                        setState(() {
                          if (value == value) {
                            buttonblue = COLORS.accent;
                          } else if (controller1.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          } else {
                            buttonblue = COLORS.accent;
                          }
                        });
                      }),

                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),

                  ///Occupation
                  imptext(mtext: "Occupation"),
                  SizedBox(
                    height: SizeConfig.blockHeight,
                  ),

                  ///TFF for occupation
                  formfield(
                      control: controller2,
                      hinttext: "Enter your occupation",
                      keyboardt: TextInputType.text,
                      valid: (value) {
                        if (value!.contains(" ")) {
                          return "Wrong Information";
                        } else if (value.isEmpty) {
                          return "Wrong Information";
                        } else if (!RegExp(r'^[a-zA-Z0-9&%=]+$')
                            .hasMatch(value)) {
                          return "Wrong Information";
                        }
                        return null;
                      },
                      func: (value) {
                        if (value.isEmpty) {
                          isEmp = true;
                        } else {
                          isEmp = false;
                        }
                        setState(() {
                          if (value == value) {
                            buttonblue = COLORS.accent;
                          } else if (controller2.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          } else {
                            buttonblue = COLORS.accent;
                          }
                        });
                      }),

                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),

                  ///Pin code
                  imptext(mtext: "Pin code"),
                  SizedBox(
                    height: SizeConfig.blockHeight,
                  ),

                  ///TFF for pin code
                  formfield(
                      control: controller3,
                      hinttext: "Enter your pin code",
                      keyboardt: TextInputType.number,
                      valid: (value) {
                        if (value!.contains(" ")) {
                          return "Pin code is not valid";
                        } else if (value.isEmpty) {
                          return "Pin code is not valid";
                        } else if (!RegExp(r'^[1-9]{1}[0-9]{2}[0-9]{3}$')
                            .hasMatch(value)) {
                          return "Pin code is not valid";
                        }
                        return null;
                      },
                      func: (value) {
                        if (value.isEmpty) {
                          isEmp = true;
                        } else {
                          isEmp = false;
                        }
                        setState(() {
                          if (value.length < 6) {
                            buttonblue = COLORS.accent;
                          } else if (controller3.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          } else {
                            buttonblue = COLORS.accent;
                          }
                        });
                      }),
                  SizedBox(
                    height: SizeConfig.blockHeight * 16,
                  ),

                  ///Elevated Button(REGISTER)
                  elevatedbutton(
                      onpress:
                          controller.text.isEmpty || controller1.text.isEmpty
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UserType()));
                                  }
                                },
                      // color: controller.text.isEmpty||
                      //     controller1.text.isEmpty||
                      //     controller2.text.isEmpty||
                      //     controller3.text.isEmpty  ? COLORS.blueSecondary:COLORS.accent,
                      color: MaterialStateProperty.resolveWith((states) =>
                          controller.text.isEmpty ||
                                  controller1.text.isEmpty ||
                                  controller2.text.isEmpty ||
                                  controller3.text.isEmpty
                              ? COLORS.blueSecondary
                              : COLORS.accent),
                      buttontext: "REGISTER",
                      size: 100,
                      size1: 7)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
