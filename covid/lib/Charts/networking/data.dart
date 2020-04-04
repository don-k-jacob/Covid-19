import 'package:covid/networking/networking.dart';
class DataModel {
  Future<dynamic> getCurrentData() async {
    var Url = 'https://coronavirus-tracker-api.herokuapp.com/v2/latest';
    print(Url);
    NetworkHelp networkHelp = NetworkHelp(url: Url,);
    var wetherData = await networkHelp.getData();
    return wetherData;
  }

  Future<dynamic> getCountaryData(String name) async {
    NetworkHelp networkHelp = NetworkHelp(
        url:
        'https://pomber.github.io/covid19/timeseries.json');
    var wetherData = await networkHelp.getData();

    return wetherData['$name'];
  }
}