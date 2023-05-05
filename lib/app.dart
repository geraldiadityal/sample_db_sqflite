import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_db_sqflite/bloc/detail_news/detail_news_bloc.dart';
import 'package:sample_db_sqflite/bloc/list_news/list_news_bloc.dart';
import 'package:sample_db_sqflite/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ListNewsBloc()),
        BlocProvider(create: (_)=>DetailNewsBloc()),
      ],
      
      child: GetMaterialApp(
        title: 'Sample DB R',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
