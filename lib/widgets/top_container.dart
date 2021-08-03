import 'package:flutter/material.dart';
import 'package:librarian_app/constants/color_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TopContainer extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final String text;
  final Color circularStrokeCap;
  final Color progressColor;

  const TopContainer(
      {Key key,
      this.radius,
      this.lineWidth,
      this.percent,
      this.text,
      this.circularStrokeCap,
      this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Current Week",
            style: TextStyle(color: kGreyColor, fontSize: 15),
          ),
          SizedBox(
            height: 15.0,
          ),
          CircularPercentIndicator(
            radius: 110.0,
            lineWidth: 10.0,
            animation: true,
            percent: 0.7,
            center: new Text(
              "70.0%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progressColor,
          ),
        ],
      ),
    );
  }
}
