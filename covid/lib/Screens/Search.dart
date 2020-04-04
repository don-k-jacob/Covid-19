import 'package:covid/Charts/Chart.dart';
import 'package:covid/Charts/PieChart.dart';
import 'package:flutter/material.dart';
import 'package:covid/networking/networking.dart';
import 'package:covid/constents.dart';
import 'package:covid/Charts/networking/data.dart';
Future<dynamic> covidData()async{
  NetworkHelp networkHelp =
  NetworkHelp(url: "https://pomber.github.io/covid19/timeseries.json");
  var dat = networkHelp.getData();
  print(dat.runtimeType);
}
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(

                    onTap: (){

                    },
                    style: TextStyle(
                      color: Colors.black,

                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter country name',
                      hintStyle: TextStyle(
                        color: Colors.grey,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value){
                      showSearch(context: context, delegate: DataSearch());

                    },
                  )
              ),
              LineChartSample1(),
              PieChartSample2(),
            ],
          ),
        ));
  }
}
class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query='';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {

    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    covidData();

    close(context, null);
    return LineChartSample1();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final  suggestionList =query.isEmpty?resent:countries.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index) => ListTile(
      onTap: ()async{
        covidData();
        name=suggestionList[index];
        query=suggestionList[index];
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
          text: suggestionList[index].toString().substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: suggestionList[index].toString().substring(query.length),
            style: TextStyle(color: Colors.grey),
          )]
      ),
      ),
    ),
      itemCount: suggestionList.length,
    );
  }

}
