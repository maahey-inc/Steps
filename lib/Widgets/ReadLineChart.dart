import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_app/Provider/home_provider.dart';
import 'package:quiver/iterables.dart' as quiver;

//! chart examples
// https://github.com/imaNNeoFighT/fl_chart/blob/master/repo_files/documentations/line_chart.md#sample-2-source-code

class ReadLineChart extends StatefulWidget {
  ReadLineChart({
    Key key,
    this.mondaySteps,
    this.tuesdaySteps,
    this.wednesdaySteps,
    this.thursdaySteps,
    this.fridaySteps,
    this.saturdaySteps,
    this.sundaySteps,
  }) : super(key: key);
  final double mondaySteps;
  final double tuesdaySteps;
  final double wednesdaySteps;
  final double thursdaySteps;
  final double fridaySteps;
  final double saturdaySteps;
  final double sundaySteps;
  final weekDays = const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  // final List<double> yValues = const [0, 0, 75, 0, 0, 0, 0, 0, 0];
  @override
  _ReadLineChartState createState() => _ReadLineChartState();
}

class _ReadLineChartState extends State<ReadLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  double touchedValue;

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Color(0xff232d37)),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: LineChart(
                  showAvg ? avgData() : mainData(),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: 60,
          //   height: 34,
          //   child: TextButton(
          //     onPressed: () {
          //       setState(() {
          //         showAvg = !showAvg;
          //       });
          //     },
          //     child: Text(
          //       'avg',
          //       style: TextStyle(
          //           fontSize: 12,
          //           color:
          //               showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  LineChartData mainData() {
    final List<double> yValues = [
      Provider.of<Homeprovider>(context, listen: false).saturdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).sundayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).mondayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).tuesdayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).wednesdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).thursdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).fridayReadMinutes ?? 0,
      // widget.saturdaySteps,
      // widget.sundaySteps,
      // widget.mondaySteps,
      // widget.tuesdaySteps,
      // widget.wednesdaySteps,
      // widget.thursdaySteps,
      // widget.fridaySteps,
    ];
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          interval: 1,
          getTextStyles: (context, value) {
            final isTouched = value == touchedValue;
            return TextStyle(
              color: isTouched ? Colors.white : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            );
          },
          getTitles: (value) {
            return widget.weekDays[value.toInt()];
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: yValues[0] == null
          ? 0
          : yValues.reduce((curr, next) => curr > next ? curr : next) /
              0.8, // max value / 0.5 to prevent drawing outside the border
      clipData: FlClipData.all(), // prevent drawing outside the border
      lineBarsData: [
        LineChartBarData(
          spots: yValues.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value);
          }).toList(),
          isCurved: false,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            // cutOffY: 2,
            // applyCutOffY: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    final List<double> yValues = [
      // widget.saturdaySteps,
      // widget.sundaySteps,
      // widget.mondaySteps,
      // widget.tuesdaySteps,
      // widget.wednesdaySteps,
      // widget.thursdaySteps,
      // widget.fridaySteps,
      Provider.of<Homeprovider>(context, listen: false).saturdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).sundayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).mondayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).tuesdayReadMinutes ?? 0,
      Provider.of<Homeprovider>(context, listen: false).wednesdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).thursdayReadMinutes ??
          0,
      Provider.of<Homeprovider>(context, listen: false).fridayReadMinutes ?? 0,
    ];
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            return widget.weekDays[value.toInt()];
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: yValues.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value);
          }).toList(),
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
