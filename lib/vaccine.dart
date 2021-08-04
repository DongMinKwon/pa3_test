import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa3_test/main.dart';
import 'package:provider/provider.dart';
import 'package:pa3_test/graph1.dart';
import 'package:pa3_test/dataset.dart';
import 'package:pa3_test/calc_data.dart';
import 'package:fl_chart/fl_chart.dart';

class Vaccine extends StatelessWidget{
  final Map<String, String> arg;

  Vaccine(this.arg);

  @override
  Widget build(BuildContext context){
    int flag = 1;

    return Scaffold(
      body: Center(
          child: FutureBuilder(
            future: fetchVaccine(),
            builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);
              if(snapshot.hasData){
                Widget tmp = FutureVacc(flag, snapshot.data, context: context);
                flag = 0;
                return tmp;
              }
              else return Center(child: CircularProgressIndicator());

            }
          )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            vaccineProvider.setGraph(LineChart(graph1()));
            return Navigator.pushNamed(
                context,
                "/navigate",
                arguments: {"previous" : "Vaccine Page", "loginID" : "${arg["loginID"]}"}
            );
          },
          child: Icon(Icons.list)
      ),
    );
  }
}

class FutureVacc extends StatelessWidget{

  BuildContext context;
  List<VaccineData> _vaccineDataList;
  int flag;

  FutureVacc(this.flag, this._vaccineDataList, {Key key, @required this.context}) : super(key : key){

    if(flag == 1){
      print("Start calculating Vaccine data");
      CalcData _calcData = CalcData(_vaccineDataList);
      vaccineData = _calcData;
      dateTotalList = vaccineData.getTotal();
      dateDailyList = vaccineData.getDaily();
      dateList = vaccineData.getDate();
      print("Complete Calculating");
    }
    vaccineProvider = Provider.of<VaccineProvider>(context);

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
                      Text("total", textAlign: TextAlign.center,),
                      Text("fully", textAlign: TextAlign.center,),
                      Text("daily", textAlign: TextAlign.center,),
                    ]
                )
            );
          }
          else{
            return Padding(
                padding: EdgeInsets.all(5),
                child:  Consumer<VaccineProvider>(
                    builder: (context, _provider, child) => Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,

                      children: <Widget>[
                        Text(_provider.sortList[i-1].country, textAlign: TextAlign.center,),
                        Text(_provider.sortList[i-1].getListData()[0].total.toString(), textAlign: TextAlign.center, ),
                        Text(_provider.sortList[i-1].getListData()[0].peopleFully.toString(), textAlign: TextAlign.center, ),
                        Text(_provider.sortList[i-1].getListData()[0].daily.toString(), textAlign: TextAlign.center)
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
                            Text("Total Vacc."),
                            Text("${dateTotalList[0].toString()} people")
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total Fully Vacc."),
                              Text("${vaccineData.getFully().toString()} people"),
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
                            Text(dateList[0])
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Daily Vacc."),
                              Text("${dateDailyList[0].toString()} people"),
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
                            vaccineProvider.setGraph(LineChart(graph1()));
                          }, child: Text("Graph1"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            vaccineProvider.setGraph(LineChart(graph2()));
                          }, child: Text("Graph2"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            vaccineProvider.setGraph(LineChart(graph3()));
                          }, child: Text("Graph3"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            vaccineProvider.setGraph(LineChart(graph4()));
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
                      child: Consumer<VaccineProvider>(
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
                            vaccineProvider.setList(vaccineData.getAlphaSort());
                          }, child: Text("Country_name"),
                          style: TextButton.styleFrom(
                              primary: Colors.lightBlueAccent
                          ),
                        )),
                        Expanded(child: TextButton(
                          onPressed: (){
                            vaccineProvider.setList(vaccineData.getTotalSort());
                          }, child: Text("Total_vacc"),
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