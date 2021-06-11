import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurghada24/cubit/cubit.dart';
import 'package:hurghada24/cubit/states.dart';
import 'package:hurghada24/shared/componants/componants.dart';
final _formKey = GlobalKey<FormState>();
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).search;
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state){

       return Scaffold(
           appBar: AppBar(),
           body: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: TextFormField(
                   key: _formKey,
                    autofocus: true,
                   controller: searchController,
                   keyboardType: TextInputType.text,
                   onChanged:(String value){
                     NewsCubit.get(context).getSearch(value);

                   },
                   decoration: InputDecoration(
                     labelText: 'Search',
                     prefixIcon:Icon(Icons.search),
                   ),
                   validator: (String value) {
                     if (value.isEmpty) {
                       return 'search must not be empty';
                     }
                     return null;
                   },
                 ),
               ),
               // Expanded(child: articaleBuilder(list, context))
             ],

           )
       );

     },

    );
  }
}
