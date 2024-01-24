import 'package:ffgame4/bloc/addingdata/addingdata_bloc.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/learning_tasks/album_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ffgame4/components/colors.dart';

class AddingData extends StatefulWidget {
  const AddingData({Key? key}) : super(key: key);

  @override
  State<AddingData> createState() => _AddingDataState();
}

class _AddingDataState extends State<AddingData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  late AddingdataBloc addingDataBloc;
  dynamic isLoading = false;

  @override
  void initState() {
    super.initState();
    addingDataBloc = BlocProvider.of<AddingdataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        key: formKey,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: BlocListener<AddingdataBloc, AddingdataState>(
              bloc: addingDataBloc,
              listener: (context, state) {
                if (state is SuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Passed into the album!!",
                        style:
                            TextStyle(fontSize: SizeConfig.blockHeight * 2.5),
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
                  isLoading = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AlbumSuccess(title: state.title, id: state.id)));
                } else if (state is LoadingState) {
                  isLoading = true;
                } else if (state is ErrorState) {
                  isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Something Went Wrong, try again!!")));
                }
                setState(() {

                });
              },

              child: Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.3,
                    left: SizeConfig.blockWidth * 8,
                    right: SizeConfig.blockWidth * 8),
                child: Column(
                  children: [
                    Text(
                      "Create your album",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockHeight * 3),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 3,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Wrong Information";
                        }
                        return null;
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
                            vertical: SizeConfig.blockHeight * 3,
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
                        labelText: "Album name",
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
                      height: SizeConfig.blockHeight * 8,
                    ),

                    ///CREATE
                    ElevatedButton(
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 5));
                          if (formKey.currentState!.validate()) {
                            addingDataBloc
                                .add(SuccessEvent(title: controller.text));
                            controller.clear();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.green),
                            fixedSize: MaterialStateProperty.all(Size(
                                SizeConfig.blockWidth * 40,
                                SizeConfig.blockHeight * 7))),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: COLORS.accent,
                              )
                            : const Text(
                                "CREATE",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                    SizedBox(
                      height: SizeConfig.blockHeight * 4,
                    ),

                    ///User
                    elevatedbutton(
                        onpress: () {},
                        color: MaterialStateProperty.resolveWith(
                            (states) => Colors.green),
                        buttontext: "User",
                        size: 40,
                        size1: 7)
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
