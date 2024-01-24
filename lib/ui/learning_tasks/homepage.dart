import 'package:ffgame4/bloc/photos_bloc/photos_bloc.dart';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:ffgame4/ui/learning_tasks/single_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PhotosBloc photosBloc;

  @override
  void initState() {
    super.initState();
    photosBloc = BlocProvider.of<PhotosBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PhotosBloc, PhotosState>(
          bloc: photosBloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
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
              ));
            }
            else if (state is AddPhotosState) {
              return ListView.builder(
                  itemCount: state.photos.length,
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
                            "${state.photos[index].id}",
                            style: const TextStyle(
                              fontFamily: "NunitoSans",
                            ),
                          ),

                          ///Text
                          Text(
                            "${state.photos[index].title}",
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => PhotosBloc()..add(NewEvent(id: state.photos[index].id)),
                                        child: const SingleData(),
                                      ),
                                    ));
                              },
                              child:
                                  Image.network("${state.photos[index].url}")),
                          SizedBox(
                            height: SizeConfig.blockHeight * 2,
                          ),

                          ///Uri
                          Image.network("${state.photos[index].thumbnailUrl}")
                        ],
                      ),
                    );
                  });
            } else if (state is NewState) {
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
                          photosBloc.add(AddPhotosEvent());
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
            } else if (state is ErrorState) {
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
                          photosBloc.add(AddPhotosEvent());
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
    );
  }
}
