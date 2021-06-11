import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurghada24/cubit/states.dart';
import 'package:hurghada24/modules/business/business_screen.dart';
import 'package:hurghada24/modules/science/scince_screen.dart';
import 'package:hurghada24/modules/sports/sports_screen.dart';
import 'package:hurghada24/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer,),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined,),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavState(int index) {
    currentIndex = index;
    if (index == 1)
      getSport();
    if (index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'accd0f0cace247e0864b76d142b4bfbb',
      },
    ).then((value) {
      //print(value.data['articles'][1]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportLoadingState());

    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'sport',
          'apiKey': 'accd0f0cace247e0864b76d142b4bfbb',
        },
      ).then((value) {
        //print(value.data['articles'][1]['title']);
        sport = value.data['articles'];
        print(sport[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'accd0f0cace247e0864b76d142b4bfbb',
        },
      ).then((value) {
        //print(value.data['articles'][1]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetScienceSuccessState());
    };
  }

  bool isDark = false;

  void changeAppMode(){

    isDark = !isDark;

    emit(NewsChangeAppModeState());
  }

  List<dynamic> search = [];

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': '$value',
        'apiKey': 'accd0f0cace247e0864b76d142b4bfbb',
      },
    ).then((value) {
      //print(value.data['articles'][1]['title']);
      search = value.data['articles'];
     // print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}

