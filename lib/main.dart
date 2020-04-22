import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_bloc_bug/bloc/main_bloc.dart';
import 'package:easy_localization_bloc_bug/bloc/main_event.dart';
import 'package:easy_localization_bloc_bug/bloc/main_state.dart';
import 'package:easy_localization_bloc_bug/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {

  final bloc = MainBloc(); //singleton simulation

  runApp(
    EasyLocalization(
      child: BlocProvider<MainBloc>.value(
          value: bloc..add(ReadyEvent()),
          child: MyApp()
      ),
      supportedLocales: [Locale('en', 'US'), Locale('sk', 'SK')],
      path: 'resources/langs',
    ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//  MainBloc _mainBloc;
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

//  @override
//  void initState() {
//    super.initState();
//
//    _mainBloc = BlocProvider.of<MainBloc>(context);
//    _mainBloc.add(ReadyEvent());
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        home: Scaffold(
          body: BlocListener<MainBloc, MainState>(
            listener: (context, state){
              if(state is ReadyState){
                print('Go to first_page');
                rootNavigatorKey.currentState.pushNamedAndRemoveUntil("first_page", (r) => false);
              }
            },
            child: Navigator(
              key: rootNavigatorKey,
              initialRoute: 'splash_page',
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          ),
        )
    );
  }
}