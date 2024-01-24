import 'package:ffgame4/bloc/addition bloc/addition_bloc.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/learning_tasks/addition_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionPage extends StatefulWidget {
  const AdditionPage({Key? key}) : super(key: key);

  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
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
          child: BlocBuilder(
            bloc: additionBloc,
            builder: (context, state) {
              if (state is SumOfTwoNumbers) {
                // res = state.sum;
                return Container(
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
                        Text("The result is : ${state.sum}"),
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

                        ///Elevated button for subtraction
                        elevatedbutton(
                            onpress: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Subtraction operation is completed!!")));
                              additionBloc.add(SubtractTwoNumberEvent(
                                  num1: int.parse(num1.text),
                                  num2: int.parse(num2.text)));
                            },
                            color: MaterialStateProperty.resolveWith(
                                    (states) => COLORS.accent),
                            buttontext: "SUBTRACT",
                            size: 100,
                            size1: 7),

                        ///Elevated button for multiplication
                        elevatedbutton(
                            onpress: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Multiplication operation is completed!!")));
                              additionBloc.add(MultiplyTwoNumberEvent(
                                  num1: int.parse(num1.text),
                                  num2: int.parse(num2.text)));
                            },
                            color: MaterialStateProperty.resolveWith(
                                    (states) => COLORS.accent),
                            buttontext: "MULTIPLY",
                            size: 100,
                            size1: 7),

                        ///Elevated button for division
                        elevatedbutton(
                            onpress: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Division operation is completed!!")));
                              additionBloc.add(DivideTwoNumberEvent(
                                  num1: int.parse(num1.text),
                                  num2: int.parse(num2.text)));
                            },
                            color: MaterialStateProperty.resolveWith(
                                    (states) => COLORS.accent),
                            buttontext: "DIVIDE",
                            size: 100,
                            size1: 7),

                        ///Elevated button for navigating to the blocListener page
                        elevatedbutton(
                            onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<AdditionBloc>(
                                            create: (context) => AdditionBloc(),
                                            child: const AdditionListener(),
                                          )));
                            },
                            color: MaterialStateProperty.resolveWith(
                                    (states) => COLORS.accent),
                            buttontext: "NAVIGATE TO LISTENER PAGE FOR ADDITION",
                            size: 100,
                            size1: 7)
                      ],
                    ));
              }
              return Container(
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

                      ///Elevated button for subtraction
                      elevatedbutton(
                          onpress: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Subtraction operation is completed!!")));
                            additionBloc.add(SubtractTwoNumberEvent(
                                num1: int.parse(num1.text),
                                num2: int.parse(num2.text)));
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "SUBTRACT",
                          size: 100,
                          size1: 7),

                      ///Elevated button for multiplication
                      elevatedbutton(
                          onpress: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Multiplication operation is completed!!")));
                            additionBloc.add(MultiplyTwoNumberEvent(
                                num1: int.parse(num1.text),
                                num2: int.parse(num2.text)));
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "MULTIPLY",
                          size: 100,
                          size1: 7),

                      ///Elevated button for division
                      elevatedbutton(
                          onpress: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Division operation is completed!!")));
                            additionBloc.add(DivideTwoNumberEvent(
                                num1: int.parse(num1.text),
                                num2: int.parse(num2.text)));
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "DIVIDE",
                          size: 100,
                          size1: 7),

                      ///Elevated button for navigating to the blocListener page
                      elevatedbutton(
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<AdditionBloc>(
                                          create: (context) => AdditionBloc(),
                                          child: const AdditionListener(),
                                        )));
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "NAVIGATE TO LISTENER FOR ADDITION ONLY",
                          size: 100,
                          size1: 7)
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
