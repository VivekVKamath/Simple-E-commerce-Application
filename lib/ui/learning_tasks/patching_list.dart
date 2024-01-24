import 'package:ffgame4/bloc/patch_bloc/patchdata_bloc.dart';

import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/learning_tasks/patch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatchList extends StatefulWidget {
  const PatchList({Key? key}) : super(key: key);

  @override
  State<PatchList> createState() => _PatchListState();
}

class _PatchListState extends State<PatchList> {
  //List <Users> users = [];
  late PatchdataBloc patchdataBloc;
  dynamic isLoading = false;

  @override
  void initState() {
    super.initState();
    patchdataBloc = BlocProvider.of<PatchdataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<PatchdataBloc, PatchdataState>(
            builder: (context, state) {
              if (state is SuccessGetState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 3,
                      vertical: SizeConfig.blockHeight * 2),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.id.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.blockHeight),
                              border: Border.all(
                                  width: SizeConfig.blockWidth * 1.5,
                                  color: COLORS.whiteSplash)),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockHeight * 3,
                              horizontal: SizeConfig.blockWidth * 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///ID
                              Text(
                                state.id[index].id.toString(),
                                style: const TextStyle(
                                  fontFamily: "NunitoSans",
                                ),
                              ),

                              ///Title
                              Text(
                                "${state.id[index].title}",
                                style: const TextStyle(
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight,
                              ),

                              ///Body
                              Text("${state.id[index].body}"),
                              SizedBox(
                                height: SizeConfig.blockHeight * 2,
                              ),
                              elevatedbutton(
                                  onpress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider(
                                                  create: (context) =>
                                                      PatchdataBloc(),
                                                  child: PatchData(
                                                    id:state.id[index].id.toString(),
                                                    title:state.id[index].title,
                                                  ),
                                                )));
                                  },
                                  color: MaterialStateProperty.resolveWith(
                                      (states) => Colors.green),
                                  buttontext: "NEXT",
                                  size: 25,
                                  size1: 7),
                            ],
                          ),
                        );
                      }),
                );
              }
              else if(state is LoadingState){
                isLoading = true;
              }
              else if (state is ErrorState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.4,
                      horizontal: SizeConfig.blockHeight * 2),
                  child: Text(
                    "Something went wrong , please try again",
                    style: TextStyle(fontSize: SizeConfig.blockHeight * 6),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
