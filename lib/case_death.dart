import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa3_test/main.dart';
import 'package:provider/provider.dart';
import 'package:pa3_test/graph1.dart';
import 'package:pa3_test/dataset.dart';
import 'package:pa3_test/calc_data.dart';
import 'package:fl_chart/fl_chart.dart';

class CaseDeath extends StatelessWidget{
  final Map<String, String> arg;

  CaseDeath(this.arg);

  @override
  Widget build(BuildContext context){
    int flag = 1;

    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: fetchCases(),
              builder: (context, snapshot){
                if(snapshot.hasError) print(snapshot.error);
                if(snapshot.hasData){
                  Widget tmp = FutureCases(flag, snapshot.data, context: context);
                  flag = 0;
                  return tmp;
                }
                else return Center(child: CircularProgressIndicator());

              }
          )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            caseProvider.setGraph(LineChart(graph5()));
            return Navigator.pushNamed(
                context,
                "/navigate",
                arguments: {"previous" : "Cases/Deaths page", "loginID" : "${arg["loginID"]}"}
            );
          },
          child: Icon(Icons.list)
      ),
    );
  }
}

class FutureCases extends StatelessWidget{
  BuildContext context;
  List<CasesData> _caseDataList;
  int flag;

  FutureCases(this.flag, this._caseDataList, {Key key, @required this.context}) : super(key : key){

    if(flag == 1){
      print("Start calculating Cases/Deaths data");
      CalcDataCase _calcDataCase = CalcDataCase(_caseDataList);
      casesData = _calcDataCase;
      dateTotalCaseList = casesData.getTotalCase();
      dateNewCaseList = casesData.getNewCase();
      dateCaseList = casesData.getDate();
      print("Complete Calculating");
    }

    caseProvider = Provider.of<CaseProvider>(context);

  }

  Widget _buildListView(){
    return ListView.builder(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (BuildContext context, int i){
          if(i == 0){
            return Padding(
                padding: EdgeInsets.all(5),
                child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,

                    children: <Widget>[
                      Text("country", textAlign: TextAlign.center,),
                      Text("total cases", textAlign: TextAlign.center,),
                      Text("daily cases", textAlign: TextAlign.center,),
                      Text("total deaths", textAlign: TextAlign.center,),
                    ]
                )
            );
          }
          else{
            return Padding(
                padding: EdgeInsets.all(5),
                child:  Consumer<CaseProvider>(
                    builder: (context, _provider, child) => Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,

                      children: <Widget>[
                        Text(_provider.sortList[i-1].country, textAlign: TextAlign.center,),
                        Text(_provider.sortList[i-1].getListData()[0].totalCase.toInt().toString(), textAlign: TextAlign.center, ),
                        Text(_provider.sortList[i-1].getListData()[0].newCase.toInt().toString(), textAlign: TextAlign.center, ),
                        Text(_provider.sortList[i-1].getListData()[0].totalDeath.toInt().toString(), textAlign: TextAlign.center)
                      ],
                    )
                )
            );
          }
        }
    );
  }

  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width:320,
            height:100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Total Cases."),
                            Text("${dateTotalCaseList[0].toString()} people")
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total Deaths."),
                              Text("${casesData.getTotalDeath().toInt().toString()} people"),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Parsed latest date"),
                            Text(dateCaseList[0])
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Daily Cases."),
                              Text("${dateNewCaseList[0].toString()} people"),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
        Container(
            width:320,
            height: 215,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom:15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setGraph(LineChart(graph5()));
                          }, child: Text("Graph1"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setGraph(LineChart(graph6()));
                          }, child: Text("Graph2"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setGraph(LineChart(graph7()));
                          }, child: Text("Graph3"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setGraph(LineChart(graph8()));
                          }, child: Text("Graph4"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left:10),
                      width: 270,
                      child: Consumer<CaseProvider>(
                          builder: (context, _provider, child) => _provider.graph
                      )
                  ),
                  flex: 4,
                )
              ],
            )
        ),
        Container(
            width:320,
            height: 215,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom:15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setList(casesData.getCaseSort());
                          }, child: Text("Total Cases"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            caseProvider.setList(casesData.getDeathSort());
                          }, child: Text("Total Deaths"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                      child: _buildListView()
                    //child: Text("haha")
                  ),
                  flex: 4,
                )
              ],
            )
        ),
      ],
    );
  }


}