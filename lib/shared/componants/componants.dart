import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

Widget buildArticleIem(articale, context) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.0,
            height: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      '${articale['urlToImage']}'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 110,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${articale['title']}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),),
                  Text(
                    '${articale['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );

Widget myDivider() =>
    Padding(
      padding: const EdgeInsetsDirectional.only(start: 15.0,
          end: 15),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[200],

      ),
    );


Widget articaleBuilder(list, context) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) =>
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleIem(list[index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget),
    )
;