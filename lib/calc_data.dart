import 'package:pa3_test/dataset.dart';

class CalcDataCase{
  List<CasesData> _caseData;
  List<CasesData> totalCaseSortList;
  List<CasesData> totalDeathSortList;

  CalcDataCase(this._caseData){
    reverseInfo();
    totalCaseSortList = totalCaseSort();
    totalDeathSortList = totalDeathSort();
  }

  List<CasesData> getList(){
    return _caseData;
  }

  List<CasesData> getCaseSort(){
    return totalCaseSortList;
  }

  List<CasesData> getDeathSort(){
    return totalDeathSortList;
  }

  List<CasesData> totalCaseSort(){
    List<CasesData> newList = <CasesData>[];

    newList.addAll(_caseData);

    newList.sort((a, b) => nullExcept(b.getListData()[0].totalCase).compareTo(nullExcept(a.getListData()[0].totalCase)));

    return newList;
  }

  double nullExcept(double num){
    if(num == null)
      return 0;
    else return num;
  }

  List<CasesData> totalDeathSort(){
    List<CasesData> newList = <CasesData>[];

    newList.addAll(_caseData);

    newList.sort((a, b) => nullExcept(b.getListData()[0].totalDeath).compareTo(nullExcept(a.getListData()[0].totalDeath)));

    return newList;
  }

  void reverseInfo(){
    for(int i = 0; i<_caseData.length; i++){
      for(int j = 0; j<_caseData[i].info.length/2;j++){
        var tmp = _caseData[i].info[j];
        _caseData[i].info[j] = _caseData[i].info[_caseData[i].info.length-1-j];
        _caseData[i].info[_caseData[i].info.length-1-j] = tmp;
      }
    }
  }

  List<String> getDate(){
    List<String> _dateList = <String>[];

    for(int i = 0; i<_caseData.length; i++){
      if(_caseData[i].country.compareTo("South Korea") == 0){
        for(int j = 0; j<29; j++){
          _dateList.add(_caseData[i].getListData()[j].date);
        }
      }
    }

    return _dateList;
  }

  List<int> getTotalCase(){
    List<int> dateTotalList = <int>[];

    for(int k = 0; k<29; k++){
      int cases = 0;

      for(int i = 0; i<_caseData.length; i++){
        if(k < _caseData[i].info.length){
          for(int j = k; j<_caseData[i].info.length; j++){
            if(_caseData[i].getListData()[j].totalCase != null){
              cases += _caseData[i].getListData()[j].totalCase.toInt();
              break;
            }
          }
        }
      }
      dateTotalList.add(cases);
    }


    return dateTotalList;
  }

  int getTotalDeath(){
    int death = 0;

    for(int i = 0; i<_caseData.length; i++){
      for(int j = 0; j<_caseData[i].info.length; j++){
        if(_caseData[i].getListData()[j].totalDeath != null){
          death += _caseData[i].getListData()[j].totalDeath.toInt();
          break;
        }
      }
    }
    return death;
  }

  List<int> getNewCase(){
    List<int> dateDailyList = <int>[];

    for(int k = 0; k<29; k++){
      int newCase= 0;

      for(int i = 0; i<_caseData.length; i++){
        if(k<_caseData[i].info.length){
          for(int j = k; j<_caseData[i].info.length; j++){
            if(_caseData[i].getListData()[j].newCase != null){
              newCase += _caseData[i].getListData()[j].newCase.toInt();
              break;
            }
          }
        }
      }
      dateDailyList.add(newCase);

    }


    return dateDailyList;

  }

}

class CalcData{
  List<VaccineData> _vaccineData;
  List<VaccineData> alphaSortList;
  List<VaccineData> totalSortList;

  CalcData(this._vaccineData){
    reverseInfo();
    alphaSortList = alphaSort();
    totalSortList = totalSort();
  }

  List<VaccineData> getList(){
    return _vaccineData;
  }

  List<VaccineData> getAlphaSort(){
    return alphaSortList;
  }

  List<VaccineData> getTotalSort(){
    return totalSortList;
  }

  int nullExcept(int num){
    if(num == null)
      return 0;
    else return num;
  }

  List<VaccineData> alphaSort(){
    List<VaccineData> newList = <VaccineData>[];

    newList.addAll(_vaccineData);
    newList.sort((a, b) => a.country.compareTo(b.country));

    return newList;

  }

  List<VaccineData> totalSort(){
    List<VaccineData> newList = <VaccineData>[];

    newList.addAll(_vaccineData);
    newList.sort((a, b) => nullExcept(b.getListData()[0].total).compareTo(nullExcept(a.getListData()[0].total)));

    return newList;
  }

  void reverseInfo(){
    for(int i = 0; i<_vaccineData.length; i++){
      for(int j = 0; j<_vaccineData[i].info.length/2;j++){
        var tmp = _vaccineData[i].info[j];
        _vaccineData[i].info[j] = _vaccineData[i].info[_vaccineData[i].info.length-1-j];
        _vaccineData[i].info[_vaccineData[i].info.length-1-j] = tmp;
      }
    }
  }

  List<String> getDate(){
    List<String> _dateList = <String>[];

    for(int i = 0; i<_vaccineData.length; i++){
      if(_vaccineData[i].country.compareTo("South Korea") == 0){
        for(int j = 0; j<29; j++){
          _dateList.add(_vaccineData[i].getListData()[j].date);
        }
      }
    }

    return _dateList;
  }

  List<int> getTotal(){
    List<int> dateTotalList = <int>[];

    for(int k = 0; k<29; k++){
      int total = 0;

      for(int i = 0; i<_vaccineData.length; i++){
        if(k < _vaccineData[i].info.length){
          for(int j = k; j<_vaccineData[i].info.length; j++){
            if(_vaccineData[i].getListData()[j].total != null){
              total += _vaccineData[i].getListData()[j].total;
              break;
            }
            else if(_vaccineData[i].getListData()[j].people != null){
              total += _vaccineData[i].getListData()[j].people;
              break;
            }
            else if(_vaccineData[i].getListData()[j].peopleFully != null){
              total += _vaccineData[i].getListData()[j].peopleFully;
              break;
            }
          }
        }
      }
      dateTotalList.add(total);
    }


    return dateTotalList;
  }

  int getFully(){
    int fully = 0;

    for(int i = 0; i<_vaccineData.length; i++){
      for(int j = 0; j<_vaccineData[i].info.length; j++){
        if(_vaccineData[i].getListData()[j].peopleFully != null){
          fully += _vaccineData[i].getListData()[j].peopleFully;
          break;
        }
      }
    }
    return fully;
  }

  List<int> getDaily(){
   List<int> dateDailyList = <int>[];

    for(int k = 0; k<29; k++){
      int daily = 0;

      for(int i = 0; i<_vaccineData.length; i++){
        if(k<_vaccineData[i].info.length){
          for(int j = k; j<_vaccineData[i].info.length; j++){
            if(_vaccineData[i].getListData()[j].daily != null){
              daily += _vaccineData[i].getListData()[j].daily;
              break;
            }
          }
        }
      }
      dateDailyList.add(daily);

    }


    return dateDailyList;

  }

}
