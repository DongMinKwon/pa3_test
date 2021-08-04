import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pa3_test/welcome_page.dart';
import 'package:pa3_test/navigate.dart';
import 'package:pa3_test/case_death.dart';
import 'package:pa3_test/vaccine.dart';
import 'package:pa3_test/graph1.dart';
import 'package:provider/provider.dart';
import 'package:pa3_test/dataset.dart';
import 'package:pa3_test/calc_data.dart';

CalcData vaccineData;
List<int> dateTotalList;
List<int> dateDailyList;
List<String> dateList;
VaccineProvider vaccineProvider;

CalcDataCase casesData;
List<int> dateTotalCaseList;
List<int> dateNewCaseList;
List<String> dateCaseList;
CaseProvider caseProvider;

void main() => runApp(MyApp());


class VaccineProvider with ChangeNotifier{
  LineChart _graph;
  List<VaccineData> _list;
  get graph => _graph;
  get sortList => _list;

  VaccineProvider(this._graph, this._list);

  void setGraph(LineChart graph){
    _graph = graph;
    notifyListeners();
  }

  void setList(List<VaccineData> list){
    _list = list;
    notifyListeners();
  }
}

class CaseProvider with ChangeNotifier{
  LineChart _graph;
  List<CasesData> _list;
  get graph => _graph;
  get sortList => _list;

  CaseProvider(this._graph, this._list);

  void setGraph(LineChart graph){
    _graph = graph;
    notifyListeners();
  }

  void setList(List<CasesData> list){
    _list = list;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VaccineProvider(LineChart(graph1()), vaccineData.getAlphaSort())),
        ChangeNotifierProvider(create: (context) => CaseProvider(LineChart(graph5()), casesData.getCaseSort())),
      ],
      child: MaterialApp(
        title: 'PA3',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (routerSettings){
          switch(routerSettings.name){
            case '/':
              return MaterialPageRoute(builder: (_) => MyHome());
            case '/welcome':
              return MaterialPageRoute(builder: (_) => Welcome(routerSettings.arguments));
            case '/navigate':
              return MaterialPageRoute(builder: (_) => Navigate(routerSettings.arguments));
            case '/CaseDeath':
              return MaterialPageRoute(builder: (_) => CaseDeath(routerSettings.arguments));
            case '/vaccine':
              return MaterialPageRoute(builder: (_) => Vaccine(routerSettings.arguments));
            default:
              return MaterialPageRoute(builder: (_) => MyHome());
          }
        },
      )
    );
  }
}

class MyHome extends StatelessWidget {

  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          title: Text('2017313135 권동민'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('CORONA LIVE', style: TextStyle(color: Colors.blue, fontSize: 30),),
                    Text('Login Please...'),
                  ],
                )
              ),
              Container(
                width: 250,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("ID: ", style: TextStyle(fontSize: 20),),
                         SizedBox(
                           width: 180,
                           child: TextField(
                             controller: idController,
                           ),
                         )
                       ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PW: ", style: TextStyle(fontSize: 20),),
                          SizedBox(
                            width: 180,
                            child: TextField(
                              controller: pwController,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        child: Text("Login"),
                        onPressed: (){
                          if(idController.text == 'skku' && pwController.text == "1234"){
                            Navigator.pushNamed(
                              context,
                              '/welcome',
                              arguments: {"loginID" : idController.text}
                            );
                          }
                        }
                      )
                    ],
                  )
                )
              )
            ],
          ),
        ),
      );
  }
}



