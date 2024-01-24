import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/landing_pages/login_page.dart';
import 'package:ffgame4/ui/purchase_pages/purchase_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  dynamic rad=1;
  dynamic radlit=1;
  var buttonblue = COLORS.blueSecondary;
  bool isEmp=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
          onTap: (){
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
            padding: EdgeInsets.only(right: SizeConfig.blockWidth*4),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context)=> const LoginPage()
                )
                );
              },
              child: Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: COLORS.accentDark,
                        fontWeight: FontWeight.w700,
                        fontFamily: "NunitoSans",
                        fontSize: SizeConfig.blockHeight*3
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockWidth*2,),
                  Icon(
                    Icons.logout,
                    color: COLORS.accentDark,
                    size: SizeConfig.blockWidth*5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              top: SizeConfig.blockHeight*6,
              left: SizeConfig.blockWidth*5,
              right: SizeConfig.blockWidth*5,
            ),
            child: Column(
              children: [

                ///User type
                titletext(
                    text: "User Type",
                    subtext: "Please select user type."
                ),
                SizedBox(height: SizeConfig.blockHeight*8,),

                ///RLT for normal user
                radiolisttile(
                    color: radlit==1? COLORS.accent:COLORS.blackLight,
                    activecolor: radlit==1? COLORS.accent:COLORS.blackLight,
                    title: "Normal User",
                    value: 1,
                    grpvalue: radlit,
                    onchanged: (value){
                      setState(() {
                        radlit= value;
                      }
                      );
                    }
                ),
                SizedBox(height: SizeConfig.blockHeight*3,),

                ///RLT for buyer
                radiolisttile(
                    color: radlit==2? COLORS.accent:COLORS.blackLight,
                    activecolor: radlit==2? COLORS.accent:COLORS.blackLight,
                    title: "Buyer",
                    value: 2,
                    grpvalue: radlit,
                    onchanged: (value){
                      setState(() {
                        radlit= value;
                      }
                      );
                    }
                ),
                SizedBox(height: SizeConfig.blockHeight*4,),

                ///RLT for seller
                radiolisttile(
                    color: radlit==3? COLORS.accent:COLORS.blackLight,
                    activecolor: radlit==3? COLORS.accent:COLORS.blackLight,
                    title: "Seller",
                    value: 3,
                    grpvalue: radlit,
                    onchanged: (value){
                      setState(() {
                        radlit= value;
                      }
                      );
                    }
                ),
                SizedBox(height: SizeConfig.blockHeight*42,),
                elevatedbutton(
                    onpress: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> const PurchaseScreen()
                      )
                      );
                    },
                    color: MaterialStateProperty.resolveWith((states) => COLORS.accent),
                    buttontext: "PROCEED",
                    size: 100,
                    size1: 7
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}