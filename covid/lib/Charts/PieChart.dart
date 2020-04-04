import 'package:covid/Charts/networking/data.dart';
import 'package:covid/constents.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

DataModel dataModel = DataModel();
class PieChart2State extends State {
  int touchedIndex;
  int  confirmed;
  int deaths;
  int recovered;
  String date;
  void getCountary()async{
    if(name!=null){
      List data= await dataModel.getCountaryData(name);
      updateUI(data.last);
    }
  }
  void updateUI(dynamic pidata) {
    print(pidata);
    if(pidata == null){
      date='null';
      confirmed=0;
      deaths=0;
      recovered=0;
      return;

    }
    setState(() {
      date=pidata['date'];
      confirmed = pidata['confirmed'];
      deaths = pidata['deaths'];
      recovered =pidata['recovered'];
    });

  }
  @override
  void initState() {
    setState(() {
      getCountary();
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
//    if(cData==null)
//    {
//      PieChart2State();
//      return Center(
//        child: SpinKitRotatingCircle(color: Colors.white),
//
//      );
//
//    }
    getCountary();
    return AspectRatio(
      aspectRatio: 1.6,
      child: Card(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: const [
                Color(0xff0c274c),
                Color(0xff46426c),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                          setState(() {
                            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                pieTouchResponse.touchInput is FlPanEnd) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex = pieTouchResponse.touchedSectionIndex;
                            }
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: showingSections()),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Indicator(
                    color: Colors.red,
                    text: 'Deaths',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.purple,
                    text: 'Confirmed',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.green,
                    text: 'Recovered',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),

                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    if(confirmed==null)
      {
        getCountary();

//        return  showingSections();
      }

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 90 : 60;
      print(confirmed);
//      double rec=(confirmed)/(recovered)*100;
//      double ded=(confirmed)/(deaths)*100;
//      double con=confirmed-(rec+ded);
//      print("con=$con rec=$rec ded=$ded");
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            title: '${deaths}',
            value: deaths/100,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.purple,
            value: confirmed/100,
            title: '${confirmed}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            value: recovered/100,
            title: '${recovered}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}