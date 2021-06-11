import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurghada24/cubit/cubit.dart';
import 'package:hurghada24/cubit/states.dart';
import 'package:hurghada24/shared/componants/componants.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return articaleBuilder(list,context);
      },
    );
  }
}
