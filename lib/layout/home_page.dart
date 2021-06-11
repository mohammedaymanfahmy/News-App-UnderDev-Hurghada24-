import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurghada24/cubit/cubit.dart';
import 'package:hurghada24/cubit/states.dart';
import 'package:hurghada24/modules/search/search_screen.dart';
import 'package:hurghada24/shared/componants/componants.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>
      (
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Hurghada24',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                navigateTo(context, SearchScreen(),);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  cubit.changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavState(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }

}



