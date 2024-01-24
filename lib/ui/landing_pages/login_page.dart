import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/landing_pages/signup_page.dart';
import 'package:ffgame4/ui/landing_pages/user_type.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

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
                            text: "Login page",
                            subtext: "Enter the details to login."
                          )
                        ],
                      ),
                      ///Elevated button(SIGN UP)
                      smallbutton(
                          onpress: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=>const SignupPage()
                            )
                            );
                          },
                          buttontext: "SIGNUP",
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
                      func: (value) {},
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

                        }
                        );
                      }
                  ),

                  SizedBox(height: SizeConfig.blockHeight*55,),

                  ///Elevated Button(login)
                  elevatedbutton(
                      onpress: controller.text.isEmpty||
                          controller1.text.isEmpty ? null:(){
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=>const UserType()
                          )
                          );
                        }
                      },
                      color: MaterialStateProperty.resolveWith(
                              (states) =>
                          controller.text.isEmpty||
                              controller1.text.isEmpty ? COLORS.blueSecondary : COLORS.accent
                      ),
                      buttontext: "LOGIN",
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
