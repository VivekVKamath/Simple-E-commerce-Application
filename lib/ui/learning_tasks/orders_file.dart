import 'package:ffgame4/bloc/orders%20bloc/orders_bloc.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersFile extends StatefulWidget {
  const OrdersFile({Key? key}) : super(key: key);

  @override
  State<OrdersFile> createState() => _OrdersFileState();
}

class _OrdersFileState extends State<OrdersFile> {
  late OrdersBloc ordersBloc;
  final List<Map<dynamic, dynamic>> vicky = [
    {
      "T1": "Order 1",
      "T2": "Order 2",
      "T3": "Order 3",
      "T4": "Order 4",
      "T5": "Order 5",
    },
  ];
  final List<Map<dynamic, dynamic>> vivek = [];
  bool? check1 = false;
  bool? check2 = false;
  bool? check3 = false;
  bool? check4 = false;
  bool? check5 = false;

  @override
  void initState() {
    super.initState();
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 2,
                  horizontal: SizeConfig.blockWidth * 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontFamily: "NunitoSans",
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockHeight * 3),
                      ),
                      elevatedbutton(
                          onpress: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: vicky.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    SizeConfig.blockHeight * 2,
                                                horizontal:
                                                    SizeConfig.blockWidth * 4),
                                            height: SizeConfig.blockHeight * 90,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ///CLT 1
                                                CheckboxListTile(
                                                    title: Text(
                                                      "${vicky[index]['T1']}",
                                                    ),
                                                    value: check1,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        check1 = value;
                                                      });
                                                    }),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight,
                                                ),

                                                ///CLT2
                                                CheckboxListTile(
                                                    title: Text(
                                                      "${vicky[index]['T2']}",
                                                    ),
                                                    value: check2,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        check2 = value;
                                                      });
                                                    }),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight,
                                                ),

                                                ///CLT3
                                                CheckboxListTile(
                                                    title: Text(
                                                      "${vicky[index]['T3']}",
                                                    ),
                                                    value: check3,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        check3 = value;
                                                      });
                                                    }),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight,
                                                ),

                                                ///CLT4
                                                CheckboxListTile(
                                                    title: Text(
                                                      "${vicky[index]['T4']}",
                                                    ),
                                                    value: check4,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        check4 = value;
                                                      });
                                                    }),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight,
                                                ),

                                                ///CLT5
                                                CheckboxListTile(
                                                  title: Text(
                                                    "${vicky[index]['T5']}",
                                                  ),
                                                  value: check5,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      check5 = value;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight *
                                                          4,
                                                ),

                                                ///elevated button
                                                elevatedbutton(
                                                    onpress: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        ordersBloc.add(
                                                            AddOrdersEvent(
                                                                ord: vivek
                                                            )
                                                        );
                                                      });
                                                    },
                                                    color: MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            COLORS.accent),
                                                    buttontext: "ADD FILTERS",
                                                    size: 40,
                                                    size1: 7)
                                              ],
                                            ),
                                          );
                                        });
                                  });
                                });
                          },
                          color: MaterialStateProperty.resolveWith(
                              (states) => COLORS.accent),
                          buttontext: "FILTERS",
                          size: 25,
                          size1: 4)
                    ],
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: vicky.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockHeight * 2,
                              horizontal: SizeConfig.blockWidth * 4),
                          child: Column(
                            children: [
                              Text(
                                "${vicky[index]['T1']}",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockHeight * 2.5),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 2,
                              ),
                              Text(
                                "${vicky[index]['T2']}",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockHeight * 2.5),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 2,
                              ),
                              Text(
                                "${vicky[index]['T3']}",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockHeight * 2.5),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 2,
                              ),
                              Text(
                                "${vicky[index]['T4']}",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockHeight * 2.5),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 2,
                              ),
                              Text(
                                "${vicky[index]['T5']}",
                                style: TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.blockHeight * 2.5),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
