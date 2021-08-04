import 'package:flutter/material.dart';


class Navigate extends StatelessWidget{
  final Map<String, String> arg;

  Navigate(this.arg);

  static const List<String> _list = [
    "Cases/Deaths", "Vaccine"
  ];
  static const List<IconData> _iconList = [Icons.coronavirus_outlined, Icons.local_hospital];

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Menu")
      ),
      body: Column(
        children: <Widget>[
          _buildListView(context),
          Container(
            width: 300,
            height: 100,
            margin: const EdgeInsets.only(top:250),
            child: Column(
              children: [
                Text("Welcome! ${arg["loginID"]}", style: TextStyle(fontSize: 20, color:Colors.grey),),
                Text("Previous: ${arg["previous"]}", style: TextStyle(fontSize: 20, color:Colors.deepPurpleAccent),)
              ],
            )
          )
        ]
      )
    );
  }

  Widget _buildListView(BuildContext context){
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          leading: Icon(_iconList[0]),
          title: Text(
            _list[0], style: TextStyle(fontSize: 20),
          ),
          onTap: (){
            Navigator.pushNamed(
                context, "/CaseDeath",
              arguments: {"loginID" : arg["loginID"]}
            );
          },
        ),
        ListTile(
          leading: Icon(_iconList[1]),
          title: Text(
            _list[1], style: TextStyle(fontSize: 20),
          ),
          onTap: (){
            Navigator.pushNamed(
                context, "/vaccine",
                arguments: {"loginID" : arg["loginID"]}
            );
          },
        )
      ],
    );
  }

}