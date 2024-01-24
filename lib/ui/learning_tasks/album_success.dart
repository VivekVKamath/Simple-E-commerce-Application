import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:flutter/material.dart';
class AlbumSuccess extends StatefulWidget {
  final dynamic title;
  final dynamic id;
  const AlbumSuccess({Key? key,required this.id,required this.title}) : super(key: key);

  @override
  State<AlbumSuccess> createState() => _AlbumSuccessState();
}

class _AlbumSuccessState extends State<AlbumSuccess> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.31,
                  left: SizeConfig.blockWidth * 8,
                  right: SizeConfig.blockWidth * 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ///Success
                  Text(
                    "Success",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockHeight * 5),
                  ),

                  ///Icon
                  Icon(
                    Icons.check_circle,
                    color: Colors.black,
                    size: SizeConfig.blockHeight*12,
                  ),
                  SizedBox(height: SizeConfig.blockHeight,),
                  ///Details are :
                   Text(
                       "Details are :",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: SizeConfig.blockHeight * 3.5),
                   ),
                  SizedBox(height: SizeConfig.blockHeight*2,),
                  Text(
                      "Your album id: ${widget.id}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockHeight*2.5
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight,),
                  Text(
                      "Your album Name:${widget.title}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockHeight*2.5
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight*2,),
                  ///NEXT
                  elevatedbutton(
                      color: MaterialStateProperty.resolveWith(
                              (states) =>
                       Colors.green
                      ),
                      onpress: () {
                        Navigator.pop(context);
                      },
                      buttontext: "Next",
                      size: 40,
                      size1: 7),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
