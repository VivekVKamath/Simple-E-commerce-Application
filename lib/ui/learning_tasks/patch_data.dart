import 'package:ffgame4/bloc/patch_bloc/patchdata_bloc.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatchData extends StatefulWidget {
  final dynamic id;
  final dynamic title;
  const PatchData({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<PatchData> createState() => _PatchDataState();
}

class _PatchDataState extends State<PatchData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  late PatchdataBloc patchdataBloc;
  dynamic isLoading = false;

  @override
  void initState() {
    super.initState();
    controller.text = widget.id.toString();
    controller1.text = widget.title;
    patchdataBloc = BlocProvider.of<PatchdataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<PatchdataBloc, PatchdataState>(
            listener: (context, state) {
              if (state is SuccessPatchState) {
                isLoading = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Passed into the album!!",
                      style: TextStyle(fontSize: SizeConfig.blockHeight * 2.5),
                    ),
                    SizedBox(width: SizeConfig.blockWidth * 3),
                    Text(
                      "Congratulations",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: SizeConfig.blockHeight * 2.5),
                    ),
                  ],
                )));
              } else if (state is LoadingState) {
                isLoading = true;
              } else if (state is ErrorState) {
                print("error");
                isLoading = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Something went wrong!!",
                      style: TextStyle(fontSize: SizeConfig.blockHeight * 2.5),
                    ),
                    SizedBox(width: SizeConfig.blockWidth * 3),
                    Text(
                      "Try again",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.blockHeight * 2.5),
                    ),
                  ],
                )));
              }
              setState(() {});
            },
            child: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 4,
                    vertical: SizeConfig.screenHeight * 0.3),
                child: Column(
                  children: [
                    Text(
                      "Edit your data",
                      style: TextStyle(
                          fontSize: SizeConfig.blockHeight * 3.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 5.8,
                    ),

                    ///TFF for Id
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Wrong Information";
                        }
                      },
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      cursorHeight: SizeConfig.blockHeight * 4,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight * 3.5,
                            horizontal: SizeConfig.blockWidth * 4),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.blockHeight * 1)),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.blockHeight * 1)),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .3),
                        ),
                        labelText: "Enter Id",
                        labelStyle: TextStyle(
                            color: COLORS.black,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 7,
                    ),

                    ///TFF for Title
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Wrong Information";
                        }
                      },
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      cursorHeight: SizeConfig.blockHeight * 4,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      controller: controller1,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight * 3.5,
                            horizontal: SizeConfig.blockWidth * 4),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.blockHeight * 1)),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.blockHeight * 1)),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .3),
                        ),
                        labelText: "Enter Title",
                        labelStyle: TextStyle(
                            color: COLORS.black,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"),
                        hintText: "Enter data to edit",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 5,
                    ),

                    ///Elevated button
                    ElevatedButton(
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 5));
                          if (formKey.currentState!.validate()) {
                            patchdataBloc.add(
                                SuccessPatchEvent(title: controller1.text,id: controller.text));
                            controller.clear();
                            controller1.clear();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.green),
                            fixedSize: MaterialStateProperty.all(Size(
                                SizeConfig.blockWidth * 45,
                                SizeConfig.blockHeight * 7))),
                        child: const Text(
                          "EDIT",
                          style: TextStyle(
                              fontFamily: "NunitoSans", color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
