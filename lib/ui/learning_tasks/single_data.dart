import 'package:ffgame4/bloc/photos_bloc/photos_bloc.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleData extends StatefulWidget {
  const SingleData({Key? key}) : super(key: key);

  @override
  State<SingleData> createState() => _SingleDataState();
}

class _SingleDataState extends State<SingleData> {
  late PhotosBloc photosBloc;

  @override
  void initState() {
    super.initState();
    photosBloc = BlocProvider.of<PhotosBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<PhotosBloc, PhotosState>(
            bloc: photosBloc,
            builder: (context, state) {
              if (state is LoadingState) {
                return Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.4),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Loading....",
                            style: TextStyle(
                                fontFamily: "NunitoSans",
                                fontSize: SizeConfig.blockHeight * 5,
                                fontWeight: FontWeight.bold,
                                color: COLORS.accent),
                          ),
                          SizedBox(
                            width: SizeConfig.blockWidth * 5,
                          ),
                          CircularProgressIndicator(
                            value: SizeConfig.blockHeight * 5,
                            color: COLORS.accent,
                          ),
                        ],
                      )),
                );
              }
              else if (state is NewState) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.blockHeight),
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
                        "${state.newp[0].id}",
                        style: const TextStyle(
                          fontFamily: "NunitoSans",
                        ),
                      ),

                      ///Text
                      Text(
                        "${state.newp[0].title}",
                        style: const TextStyle(
                            fontFamily: "NunitoSans",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight,
                      ),

                      ///Url
                      InkWell(
                          onTap: () {
                           Navigator.pop(context);
                          },
                          child: Image.network("${state.newp[0].url}")),
                      SizedBox(
                        height: SizeConfig.blockHeight * 2,
                      ),

                      ///Uri
                      Image.network("${state.newp[0].thumbnailUrl}")
                    ],
                  ),
                );
              }
              else if (state is ErrorState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockHeight * 2,
                      horizontal: SizeConfig.blockWidth * 10),
                  child: Column(
                    children: [
                      Text(
                        "Connection Failed!!",
                        style: TextStyle(
                            fontSize: SizeConfig.blockHeight * 5,
                            fontFamily: "NunitoSans",
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 5,
                      ),
                      Image.asset("assets/images/connection-error.jpg"),
                      SizedBox(height: SizeConfig.blockHeight * 2),
                      elevatedbutton(
                          onpress: () {
                            photosBloc.add(NewEvent(id: state.id));
                          },
                          color: MaterialStateProperty.resolveWith(
                                  (states) => COLORS.red),
                          buttontext: "TRY AGAIN",
                          size: 30,
                          size1: 7)
                    ],
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
