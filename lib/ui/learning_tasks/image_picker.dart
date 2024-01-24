import 'package:ffgame4/bloc/imagepicker bloc//image_bloc.dart';
import 'package:ffgame4/helpers/reuse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ffgame4/components/colors.dart';
import 'package:ffgame4/components/config.dart';
import 'package:flutter/material.dart';

class ImagePickPage extends StatefulWidget {
   const ImagePickPage({Key? key}) : super(key: key);

  @override
  State<ImagePickPage> createState() => _ImagePickPageState();
}

class _ImagePickPageState extends State<ImagePickPage> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  late ImageBloc imageBloc;

  @override
  void initState() {
    super.initState();
    imageBloc = BlocProvider.of<ImageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder(
            bloc: imageBloc,
            builder: (context, state) {
              if(state is GalleryImages){
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockHeight * 5,
                      horizontal: SizeConfig.blockWidth * 5),
                  child: Column(
                    children: [
                      ///Image Picker
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: SizeConfig.blockHeight * 24,
                              width: SizeConfig.blockWidth * 42,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(
                                    Radius.circular(SizeConfig.blockHeight*2.5),
                                  ),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: COLORS.black)),
                              child: const Icon(Icons.photo_camera),
                            ),
                          ),
                          Positioned(
                              child: image == null
                                  ? Container()
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.fill,
                                  height: SizeConfig.blockHeight * 24,
                                  width: SizeConfig.blockWidth * 42,
                                ),
                              )),
                          Positioned(
                              top: SizeConfig.blockHeight * 17.6,
                              left: SizeConfig.blockWidth * 30.5,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                              left: SizeConfig.blockWidth * 3),
                                          height: SizeConfig.blockHeight * 10,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  image =
                                                  await picker.pickImage(
                                                      source: ImageSource
                                                          .gallery);
                                                  setState(() {
                                                    //update UI
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.photo,
                                                        size: SizeConfig
                                                            .blockHeight *
                                                            8),
                                                    SizedBox(
                                                      width: SizeConfig
                                                          .blockWidth *
                                                          2,
                                                    ),
                                                    Text(
                                                      "Choose a Photo",
                                                      style: TextStyle(
                                                          fontSize: SizeConfig
                                                              .blockHeight *
                                                              4),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child:  const CircleAvatar(
                                  child: Icon(Icons.add),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 5,
                      ),

                      ///Submit
                      elevatedbutton(
                          onpress: () {
                            setState(() {
                              image == null?
                              imageBloc.add(
                                  ErrorImageEvent(
                                      gal: image
                                  )
                              ):
                              imageBloc.add(
                                  LoadedImageEvent(
                                      gal: image
                                  )
                              );
                            });
                          },
                          color: MaterialStateProperty.resolveWith(
                                  (states) => COLORS.accent),
                          buttontext: "ADD",
                          size: 100,
                          size1: 7),
                    ],
                  ),
                );
              }
              else if(state is ErrorImages)
              {
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockHeight*5),
                  child: Column(
                    children: [
                       Text(
                           "You didn't pick any image!!",
                         style: TextStyle(
                           color: COLORS.red,
                           fontSize: SizeConfig.blockHeight*8
                         ),
                       ),
                      SizedBox(height: SizeConfig.blockHeight*2,),
                      Container(
                        height: SizeConfig.blockHeight * 24,
                        width: SizeConfig.blockWidth * 42,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(
                              Radius.circular(SizeConfig.blockHeight*2.5),
                            ),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              width: SizeConfig.blockWidth*2,
                                color: Colors.red
                            )),
                        child: Icon(
                            Icons.photo_camera,
                          size: SizeConfig.blockHeight*5,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockHeight*2,),
                      elevatedbutton(
                          onpress: (){
                            imageBloc.add(AddImageEvent(gal: image));
                          },
                          color: MaterialStateProperty.resolveWith(
                                  (states) => Colors.red),
                          buttontext: "TRY AGAIN",
                          size: 50,
                          size1:7)
                    ],
                  ),
                );
              }
              else if(state is LoadedImages)
              {
                return Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockHeight*5),
                  child: Column(
                    children: [
                       Text(
                           "Image is uploaded successfully!!",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: Colors.green,
                             fontSize: SizeConfig.blockHeight*8
                         ),
                       ),
                      SizedBox(height: SizeConfig.blockHeight*5,),
                      elevatedbutton(
                          onpress: (){
                            imageBloc.add(AddImageEvent(gal: image));
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(
                             create: (context)=> ImageBloc(),
                             child:  const ImagePickPage(),
                           )));

                          },
                          color: MaterialStateProperty.resolveWith(
                                  (states) => Colors.green),
                          buttontext: "NAVIGATE",
                          size: 50,
                          size1:7)
                    ],
                  ),
                );
              }
              return Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 5,
                    horizontal: SizeConfig.blockWidth * 5),
                child: Column(
                  children: [
                    ///Image Picker
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: SizeConfig.blockHeight * 24,
                            width: SizeConfig.blockWidth * 42,
                            decoration: BoxDecoration(
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(SizeConfig.blockHeight*2.5),
                                ),
                                shape: BoxShape.rectangle,
                                border: Border.all(color: COLORS.black)),
                            child:  const Icon(Icons.photo_camera),
                          ),
                        ),
                        Positioned(
                            child: image == null
                                ? Container()
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.fill,
                                height: SizeConfig.blockHeight * 24,
                                width: SizeConfig.blockWidth * 42,
                              ),
                            )),
                        Positioned(
                            top: SizeConfig.blockHeight * 17.6,
                            left: SizeConfig.blockWidth * 30.5,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.blockWidth * 3),
                                        height: SizeConfig.blockHeight * 10,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                image =
                                                await picker.pickImage(
                                                    source: ImageSource
                                                        .gallery);
                                                setState(() {
                                                  //update UI
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.photo,
                                                      size: SizeConfig
                                                          .blockHeight *
                                                          8),
                                                  SizedBox(
                                                    width: SizeConfig
                                                        .blockWidth *
                                                        2,
                                                  ),
                                                  Text(
                                                    "Choose a Photo",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                            .blockHeight *
                                                            4),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child:  const CircleAvatar(
                                child: Icon(Icons.add),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 5,
                    ),

                    ///Submit
                    elevatedbutton(
                        onpress: () {
                            image == null?
                            imageBloc.add(
                                ErrorImageEvent(
                                    gal: image
                                )
                            ):
                            imageBloc.add(
                                LoadedImageEvent(
                                    gal: image
                                )
                            );
                            setState(() {
                              image=null;
                            });
                        },
                        color: MaterialStateProperty.resolveWith(
                                (states) => COLORS.accent),
                        buttontext: "ADD",
                        size: 100,
                        size1: 7),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
