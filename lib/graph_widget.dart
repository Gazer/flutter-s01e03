import 'package:flutter/material.dart';
import 'package:s01e03/day_item.dart';

enum PeriodSelection {
  Days,
  Months
}

class GraphWidget extends StatefulWidget {

  List<int> dayValues = [55, 58, 45, 25, 55, 45, 60, 45];
  List<int> monthValues = [50, 63, 0, 100, 35, 15, 77, 22];
  List<String> dayLabels = [
    "28.01", "30.01", "01.02", "04.02", "06.02", "08.02", "11.02", "13.02"];
  List<String> monthLabels = ["01", "02", "03", "04", "05", "06", "07", "08"];

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  PeriodSelection periodSelected = PeriodSelection.Days;

  @override
  Widget build(BuildContext context) {
    List<int> values;
    List<String> labels;
    if (periodSelected == PeriodSelection.Days) {
      values = widget.dayValues;
      labels = widget.dayLabels;
    } else {
      values = widget.monthValues;
      labels = widget.monthLabels;
    }

    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, top: 24.0, right: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        periodSelected = PeriodSelection.Days;
                      });
                    },
                    child: Text("Days",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: periodSelected == PeriodSelection.Days
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        periodSelected = PeriodSelection.Months;
                      });
                    },
                    child: Text("Months",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: periodSelected == PeriodSelection.Months
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("(visitis in mins)",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    List<Widget> rows = [];

                    values.asMap().forEach((index, value) {
                      var label = labels[index];

                      rows.add(dayItem(label, value, constraints.maxHeight));
                    });

                    return Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: rows,
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dayItem(String day, int value, double maxHeight) {
    return DayItem(
      day: day,
      value: value,
      maxHeight: maxHeight,
    );
  }
}
