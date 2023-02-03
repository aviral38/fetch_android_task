
import 'dart:collection';

import 'package:fetch_app/each_user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}
class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff4568dc),
                Color(0xffb06ab3)
              ],
            )),
        child: Scaffold(
          appBar: AppBar(title: Text("Fetch List",),backgroundColor: Colors.orangeAccent,shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(30),
    ),),),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              FutureBuilder(future:getData(),builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData)
                  {
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        for( var data in snapshot.data) Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('ListId: ${data[0]['listId'].toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              color: Color(0xfffa500),
                              height:300,child: Scrollbar(
                                child: ListView(
                                children: [
                                  for(var items in data) userWidget(id: items['id'].toString(), name: items['name']),
                                ],
                            ),
                              ),),
                            SizedBox(height: 15,),

                            // ListView(
                            //   children: [
                            //     for(var items in data) Text(items['listId'].toString(),style: TextStyle(fontSize: 2),)
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    );
                  }
                else if(snapshot.hasError)
                  {
                    return Container();
                  }
                else
                  {
                    return Column(
                      children: [
                        SizedBox(height: height/4,),
                        Center(
                          child: Container(
                            height:200,
                            width:200,
                            child: CircularProgressIndicator(

                            ),
                          ),
                        ),
                      ],
                    );
                  }
                print(snapshot.data);

              },),

            ],
          ),
        ),
      ),
    );
  }
  Future<String> getValue() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Flutter Devs';
  }

  Future<List> getData() async {
    try {
      var response = await Dio().get('https://fetch-hiring.s3.amazonaws.com/hiring.json');
      Map<int,int> map_to_list=HashMap();
      print(response.data[0]);
      print(response.data[0]['id']);
      List<List> groups=new List.empty(growable:true);
      //var res="["+response.data.toString()+"]";//
      //List<dynamic> data = jsonDecode(response.data);
      var toRemove = [];
      await response.data.sort((a, b) => int.parse(a['listId'].toString()).compareTo(int.parse(b['listId'].toString())));
      print('ad');
      int counter=0;
     await response.data.forEach((data){
        if(data['name']==''||data['name']==null)
          {
            toRemove.add(data);
          }
        else{
          if(map_to_list.containsKey(data['listId'])==false)
          {
            map_to_list[data['listId']]=counter;
            List group_member=new List.empty(growable:true);
            group_member.add(data);
            groups.add(group_member);
            counter++;
          }
          else{
            int index=map_to_list[data['listId']]!=null?int.parse(map_to_list[data['listId']].toString()):0;
            List group_member=groups[index];
            group_member.add(data);
          }

        }

      });
      await response.data.removeWhere( (data) => toRemove.contains(data));


      for(var g in groups)
        {
          g.sort((a, b) => int.parse(a['id'].toString()).compareTo(int.parse(b['id'].toString())));
        }
      return groups;
    } catch (e) {
      print(e);
      return List.empty();
    }

  }
}
