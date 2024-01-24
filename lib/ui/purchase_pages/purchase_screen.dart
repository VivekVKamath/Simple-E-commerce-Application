import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  bool plus2 = false;
  dynamic plus;
  final List<Map<dynamic, dynamic>> vicky = [
    {
      "T1": "Product Name1 Goes \n Here Second line",
      "T2": "₹ 450.00",
      "T3": "Net Rate",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "First Name2 Goes Here\nSecond line",
      "T2": "10+2",
      "T3": "Freebies",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "10",
      "T12": "Max. Qty",
      "T13": "20",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Second Name3 Goes Here\nSecond line",
      "T2": "10%",
      "T3": "Discount",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "150",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Third Name4 Goes Here\nSecond line",
      "T2": "10+2",
      "T3": "Freebies",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "20",
      "T12": "Max. Qty",
      "T13": "150",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Fourth Name5 Goes Here\nSecond line",
      "T2": "₹ 550.00",
      "T3": "Net Rate",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Fifth Name6 Goes Here\nSecond line",
      "T2": "₹ 450.00",
      "T3": "Net Rate",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "2",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Product Name7 Goes Here\nSecond line",
      "T2": "10+2",
      "T3": "Freebies",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Seventh Name8 Goes Here\nSecond line",
      "T2": "20%",
      "T3": "Discount",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "2",
      "T10": "Min. Qty",
      "T11": "4",
      "T12": "Min. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Ninth Name8 Goes Here\nSecond line",
      "T2": "₹ 450.00",
      "T3": "Net Rate",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "10",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
    {
      "T1": "Vendor Name8 Goes Here\nSecond line",
      "T2": "15%",
      "T3": "Discount",
      "T4": "MRP",
      "T5": "₹ 500.00",
      "T6": "PTR",
      "T7": "₹ 650.00",
      "T8": "Integral Qty",
      "T9": "5",
      "T10": "Min. Qty",
      "T11": "5",
      "T12": "Max. Qty",
      "T13": "100",
      "plus": true,
      "control": TextEditingController()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vicky.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockHeight * 5,
                        left: SizeConfig.blockWidth * 5,
                        right: SizeConfig.blockWidth * 5,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${vicky[index]['T1']}",
                                    style: TextStyle(
                                        fontFamily: "NunitoSans",
                                        fontWeight: FontWeight.w600,
                                        fontSize: SizeConfig.blockHeight * 2.5
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockHeight * 3,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${vicky[index]['T4']}",
                                            style: const TextStyle(
                                                color: COLORS.blackLight,
                                                fontFamily: "NunitoSans"
                                            ),
                                          ),
                                          Text(
                                            "${vicky[index]['T5']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "NunitoSans"
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: SizeConfig.blockWidth * 4,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${vicky[index]['T6']}",
                                            style: const TextStyle(
                                                color: COLORS.blackLight,
                                                fontFamily: "NunitoSans"
                                            ),
                                          ),
                                          Text(
                                            "${vicky[index]['T7']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "NunitoSans"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: SizeConfig.blockHeight * 0.5
                                    ),
                                    height: SizeConfig.blockHeight * 8.5,
                                    width: SizeConfig.blockWidth * 28,
                                    decoration: BoxDecoration(
                                        color: COLORS.blueSecondary,
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.blockHeight
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${vicky[index]['T2']}",
                                          style: const TextStyle(
                                              fontFamily: "NunitoSans",
                                              color: COLORS.blackLight
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.blockHeight,
                                        ),
                                        Text(
                                          "${vicky[index]['T3']}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "NunitoSans"
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.blockHeight,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockHeight * 2,
                                  ),
                                  vicky[index]['plus']
                                      ? SizedBox(
                                          width: SizeConfig.blockWidth * 30,
                                          height: SizeConfig.blockHeight * 5,
                                          child: elevatedbutton(
                                              onpress: () {
                                                setState(() {
                                                  vicky[index]['control'].text =
                                                      vicky[index]['T9'];
                                                  vicky[index]['plus'] = false;
                                                }
                                                );
                                              },
                                              color: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      COLORS.accent
                                              ),
                                              buttontext: "ADD",
                                              size: 25,
                                              size1: 1
                                          ),
                                        )
                                      : SizedBox(
                                          height: SizeConfig.blockHeight * 5,
                                          width: SizeConfig.blockWidth * 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width:
                                                    SizeConfig.blockWidth * 8,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      int controller=int.parse(vicky[index]['control'].text);
                                                      int integralqty=int.parse(vicky[index]['T9']);
                                                      int diff =  controller-integralqty;
                                                      vicky[index]['control'].text=diff.toString();
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(SizeConfig
                                                                    .blockWidth *
                                                                2
                                                        ),
                                                        color: COLORS.accent
                                                    ),
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    )
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      SizeConfig.blockHeight *
                                                          6,
                                                  width: SizeConfig.blockWidth *
                                                      12,
                                                  child: TextFormField(
                                                    onTap: (){},
                                                    maxLines: 1,
                                                    initialValue:
                                                        "${vicky[index]['T11']}",
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlign: TextAlign.center,
                                                    cursorColor: Colors.black,
                                                    decoration: const InputDecoration(
                                                        isDense: true,
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black
                                                                )
                                                            )
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  )
                                              ),
                                              SizedBox(
                                                width:
                                                    SizeConfig.blockWidth * 8,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      int controller=int.parse(vicky[index]['control'].text);
                                                      int integralqty=int.parse(vicky[index]['T9']);
                                                      int sum =  controller+integralqty;
                                                      vicky[index]['control'].text=sum.toString();
                                                    }
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(SizeConfig
                                                                    .blockWidth *
                                                                2
                                                        ),
                                                        color: COLORS.accent
                                                    ),
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    )
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 3,
                          ),
                          Divider(
                            indent: SizeConfig.blockHeight,
                            endIndent: SizeConfig.blockHeight,
                            color: COLORS.blueSecondary,
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: SizeConfig.blockWidth * 5,
                              ),

                              ///Integral Qty
                              Text(
                                "${vicky[index]['T8']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    color: COLORS.blackLight
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 2,
                              ),
                              Text(
                                "${vicky[index]['T9']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 4,
                              ),

                              ///Min. Qty
                              Text(
                                "${vicky[index]['T10']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    color: COLORS.blackLight
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 2,
                              ),
                              Text(
                                "${vicky[index]['T11']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 4,
                              ),

                              ///Max. Qty
                              Text(
                                "${vicky[index]['T12']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    color: COLORS.blackLight
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockWidth * 2,
                              ),
                              Text(
                                "${vicky[index]['T13']}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 2,
                          ),
                          const Divider(
                            indent: 1,
                            endIndent: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  }
                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockHeight,
              horizontal: SizeConfig.blockWidth * 3
          ),
          child: elevatedbutton(
              onpress: () {
                setState(() {
                  plus2 != plus2;
                });
              },
              color:
                  MaterialStateProperty.resolveWith((states) => COLORS.accent),
              buttontext: plus2 ? "GO TO CART(${vicky.length})" : "GO TO CART",
              size: 100,
              size1: 7
          )
      ),
    );
  }
}
