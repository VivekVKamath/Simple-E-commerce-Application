import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/landing_pages/login_page.dart';
import 'package:ffgame4/ui/landing_pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var buttonblue = COLORS.blueSecondary;
  bool isEmp=false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth*6,
                  vertical: SizeConfig.blockHeight*4
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ///Login page
                          titletext(
                              text: "Create Account",
                              subtext: "Kindly provide the details with us."
                          )
                        ],
                      ),
                      ///Elevated button(SIGN UP)
                      smallbutton(
                          onpress: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=>const LoginPage()
                            )
                            );
                          },
                          buttontext: "LOGIN",
                          size: 27,
                          size1: 2.5,
                          bordersize:2
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight*4,),

                  ///User Name
                  imptext(mtext: "User Name"),
                  SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for user name
                  formfield(
                    control: controller,
                    hinttext: "Enter your name",
                    keyboardt: TextInputType.text,
                    valid: (value) {
                      if (value!.contains(" ")) {
                        return "Wrong Information";
                      }else if (value.isEmpty) {
                        return "Wrong Information";
                      }else if(!RegExp(r'^[a-zA-Z0-9&%=]+$').hasMatch(value))
                      {
                        return "Wrong Information";
                      }else if(value.length<2){
                        return "Wrong Information";
                      }
                      return null;
                    },
                    func: (value) {
                      setState(() {
                        if (value.length < 2) {
                          buttonblue = COLORS.accent;
                        } else if (controller.text.isEmpty) {
                          buttonblue = COLORS.blueSecondary;
                        }else {
                          buttonblue = COLORS.accent;
                        }
                      }
                      );
                    },
                  ),

                  SizedBox(height: SizeConfig.blockHeight*2,),

                  ///Email Address
                  imptext(mtext: "Email Address"),
                  SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for email address
                  formfield(
                      control: controller1,
                      hinttext: "Enter your email address",
                      keyboardt: TextInputType.emailAddress,
                      valid: (value) {
                        if (value!.contains(" ")) {
                          return "Email is not valid";
                        }else if (value.isEmpty) {
                          return "Email is not valid";
                        }else if(value.endsWith('.com')){
                          return  null;
                        }
                        else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
                        {
                          return "Email is not valid";
                        }
                        return null;
                      },
                      func: (value) {
                        setState(() {
                          if (value==value) {
                            buttonblue = COLORS.accent;
                          } else if (controller1.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          }else {
                            buttonblue = COLORS.accent;
                          }
                        }
                        );
                      }
                  ),
                  SizedBox(height: SizeConfig.blockHeight*2,),
                  imptext(mtext: "Phone Number"),
                  SizedBox(height: SizeConfig.blockHeight,),
                  SizedBox(
                    height: SizeConfig.blockHeight*10,
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      onChanged: (value) {
                        if(value.isEmpty){
                          isEmp = true;
                        }else{
                          isEmp = false;
                        }
                        setState(() {
                          if (value.length < 10) {
                            buttonblue = COLORS.accent;
                          } else if (controller2.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                          }else {
                            buttonblue = COLORS.accent;
                          }
                        }
                        );
                      },
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      controller: controller2,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight,
                            horizontal: SizeConfig.blockWidth*4
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.blackLight,
                              width: SizeConfig.blockHeight * .2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .1
                          ),
                        ),
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(
                            color: COLORS.blackLight,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1
                            )
                        ),
                      ),
                      validator: (value) {
                        if (value!.contains(" ")) {
                          return "Phone number is not valid";
                        }else if (value.isEmpty) {
                          return "Phone number is not valid";
                        }else if(!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value))
                        {
                          return "Phone number is not valid";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight*40,),
                  ///Elevated Button(login)
                  elevatedbutton(
                      onpress: controller.text.isEmpty||
                          controller1.text.isEmpty ||
                      controller2.text.isEmpty? null:(){
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=>const RegisterUser()
                          )
                          );
                        }
                      },
                      color: MaterialStateProperty.resolveWith(
                              (states) =>
                          controller.text.isEmpty||
                              controller1.text.isEmpty||
                          controller2.text.isEmpty? COLORS.blueSecondary : COLORS.accent
                      ),
                      buttontext: "REGISTER",
                      size: 100,
                      size1: 7
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
