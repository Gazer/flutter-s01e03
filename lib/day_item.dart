import 'package:flutter/material.dart';

class DayItem extends StatefulWidget {
  final String day;
  final int value;
  final double maxHeight;

  const DayItem({Key key, this.day, this.value, this.maxHeight}) : super(key: key);

  @override
  _DayItemState createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int currentValue = 0;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _controller.forward();
    _controller.addListener(() {
      setState(() {
        currentValue = (widget.value * _controller.value).floor();
      });
    });
  }


  @override
  void didUpdateWidget(DayItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    var barHeight = (widget.maxHeight - 80) * currentValue / 100.0;
    var offsetY = widget.maxHeight - barHeight - 80.0;

    return Column(
      children: <Widget>[
        SizedBox(height: offsetY),
        Text(currentValue.toString(),
            style: TextStyle(
              color: Colors.greenAccent,
            )
        ),
        SizedBox(height: 12.0,),
        Container(
          width: 2.0,
          height: barHeight,
          color: Colors.greenAccent,
        ),
        SizedBox(height: 12.0,),
        Text(widget.day,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
