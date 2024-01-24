import 'package:flutter/material.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';

Widget titletext({
  required String text,
  required String subtext,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Login page
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.blockWidth * 10),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: SizeConfig.blockWidth * 6,
                  fontWeight: FontWeight.w600,
                  fontFamily: "NunitoSans"),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 0.5,
          ),

          ///Login Details
          Text(
            subtext,
            style: TextStyle(
                color: COLORS.blackLight,
                fontFamily: "NunitoSans",
                fontSize: SizeConfig.blockWidth * 3.5),
          ),
        ],
      ),
    ],
  );
}

Widget imptext({required String mtext}) {
  return Row(
    children: [
      Text(
        mtext,
        style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: SizeConfig.blockHeight * 2.5,
            fontWeight: FontWeight.w600),
      ),
    ],
  );
}

Widget formfield(
    {required dynamic control,
    required dynamic hinttext,
    required dynamic keyboardt,
    required dynamic valid,
    required dynamic func}) {
  return SizedBox(
    height: SizeConfig.blockHeight * 10,
    child: TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: func,
      maxLines: 1,
      cursorColor: COLORS.black,
      autofocus: false,
      keyboardType: keyboardt,
      controller: control,
      style: TextStyle(
        fontSize: SizeConfig.blockHeight * 2.4,
        color: COLORS.black,
        fontFamily: "Nunitosans",
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockHeight,
            horizontal: SizeConfig.blockWidth * 4),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.blockHeight * 1)),
          borderSide: BorderSide(
              color: COLORS.blackLight, width: SizeConfig.blockHeight * .2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.blockHeight * 1)),
          borderSide: BorderSide(
              color: COLORS.black, width: SizeConfig.blockHeight * .1),
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
            color: COLORS.blackLight,
            fontSize: SizeConfig.blockHeight * 2,
            fontFamily: "Nunitosans"),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeConfig.blockHeight * 1)),
      ),
      validator: valid,
    ),
  );
}

Widget elevatedbutton({
  required dynamic onpress,
  required dynamic color,
  required String buttontext,
  required dynamic size,
  required dynamic size1,
}) {
  return ElevatedButton(
      onPressed: onpress,
      style: ButtonStyle(
        backgroundColor: color,
        fixedSize: MaterialStateProperty.all(Size(SizeConfig.blockWidth*size, SizeConfig.blockHeight*size1))
      ),
      child: Text(
        buttontext,
        style: const TextStyle(
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ));
}

Widget smallbutton({
  required dynamic onpress,
  required String buttontext,
  required dynamic size,
  required dynamic size1,
  required dynamic bordersize,
}) {
  return ElevatedButton(
    onPressed: onpress,
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockHeight * bordersize)),
        fixedSize:
            Size(SizeConfig.blockWidth * size, SizeConfig.blockHeight * size1)),
    child: Text(
      buttontext,
      style: TextStyle(
          color: Colors.black,
          fontFamily: "NunitoSans",
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.blockHeight * 2.5),
    ),
  );
}

Widget radiolisttile(
{
  required dynamic color,
  required dynamic activecolor,
  required dynamic title,
  required dynamic value,
  required dynamic grpvalue,
  required dynamic onchanged,
}
)
{
  return SizedBox(
    height: SizeConfig.blockHeight*8,
    child: RadioListTile(
        visualDensity: const VisualDensity(horizontal: -2),
        dense: true,
        activeColor: color,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: SizeConfig.blockWidth*0.3,
                style: BorderStyle.solid,
                color: color
            ),
            borderRadius: BorderRadius.circular(SizeConfig.blockHeight,)
        ),
        title: Text(
          title,
          style: TextStyle(
              color: color,
              fontFamily: "NunitoSans",
              fontSize: SizeConfig.blockHeight*2.5
          ),
        ),
        value: value,
        groupValue: grpvalue,
        onChanged: onchanged
    ),
  );
}


