import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/bloc/addition bloc/addition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionListener extends StatefulWidget {
  const AdditionListener({Key? key}) : super(key: key);

  @override
  State<AdditionListener> createState() => _AdditionListenerState();
}

class _AdditionListenerState extends State<AdditionListener> {
  final formKey = GlobalKey<FormState>();
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  late AdditionBloc additionBloc;
  dynamic res = 0;
  @override
  void initState() {
    super.initState();
    additionBloc = BlocProvider.of<AdditionBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey,
            child: BlocListener<AdditionBloc, AdditionState>(
              listener: (context, state) {
                if(state is SumOfTwoNumbers){
                  res=state.sum;
                }
              },
              child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 3,
                    horizontal: SizeConfig.blockWidth * 3,
                  ),
                  child: Column(
                    children: [
                      ///First number
                      formfield(
                          control: num1,
                          hinttext: "Enter the first number",
                          keyboardt: TextInputType.number,
                          valid: (value) {},
                          func: (value) {}),
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),

                      ///Second number
                      formfield(
                          control: num2,
                          hinttext: "Enter the second number",
                          keyboardt: TextInputType.number,
                          valid: (value) {},
                          func: (value) {}),
                      Row(
                        children: [
                          Text("The result is : $res"),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2,
                      ),

                      ///Elevated Button for addition
                      elevatedbutton(
                          onpress: () {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Addition operation is completed!!")));
                              additionBloc.add(AddTwoNumberEvent(
                                  num1: int.parse(num1.text),
                                  num2: int.parse(num2.text)));
                            });
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "ADD",
                          size: 100,
                          size1: 7),
                    ],
                  )),
            )),
      ),
    );
  }
}
