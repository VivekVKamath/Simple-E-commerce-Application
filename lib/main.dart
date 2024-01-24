import 'package:ffgame4/bloc/addingdata/addingdata_bloc.dart';
import 'package:ffgame4/bloc/addition bloc/addition_bloc.dart';
import 'package:ffgame4/bloc/imagepicker bloc/image_bloc.dart';
import 'package:ffgame4/bloc/orders%20bloc/orders_bloc.dart';
import 'package:ffgame4/bloc/patch_bloc/patchdata_bloc.dart';
import 'package:ffgame4/bloc/photos_bloc/photos_bloc.dart';
import 'package:ffgame4/ui/landing_pages/login_page.dart';
import 'package:ffgame4/ui/learning_tasks/addingdata.dart';
//import 'package:ffgame4/ui/landing_pages/login_page.dart';
import 'package:ffgame4/ui/learning_tasks/addition.dart';
import 'package:ffgame4/ui/learning_tasks/homepage.dart';
import 'package:ffgame4/ui/learning_tasks/image_picker.dart';
import 'package:ffgame4/ui/learning_tasks/orders_file.dart';
import 'package:ffgame4/ui/learning_tasks/patch_data.dart';
import 'package:ffgame4/ui/learning_tasks/patching_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FF Game 4',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*home: BlocProvider(
          create: (context) => PatchdataBloc()..add(SuccessGetEvent(title: '',id: '')),
          child: const PatchList(),
        ));*/
        home: const LoginPage());
  }
}
