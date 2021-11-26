import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 12;
  const BarChartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: 20,
                minY: 0,
                groupsSpace: 12, // space between chart lines
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  topTitles: BarTitles.getTopBottomTitles(),
                  bottomTitles: BarTitles.getTopBottomTitles(),
                  leftTitles: BarTitles.getSideTitles(),
                  rightTitles: BarTitles.getSideTitles(),
                ),
                // horizontal lines
                gridData: FlGridData(
                    checkToShowHorizontalLine: (value) =>
                        value % BarData.interval == 0,
                    getDrawingVerticalLine: (value) {
                      if (value == 0) {
                        return FlLine(
                          color: Color(0xff2a2747),
                          strokeWidth: 3,
                        );
                      } else {
                        return FlLine(
                          color: Color(0xff2a2747),
                          strokeWidth: 0.8,
                        );
                      }
                    }),
                barGroups: BarData.barData
                    .map(
                      (data) => BarChartGroupData(
                        x: data.id,
                        barsSpace: 4,
                        barRods: [
                          BarChartRodData(
                            y: data.y,
                            width: barWidth,
                            colors: [data.color],
                            borderRadius: data.y > 0
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  )
                                : BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
      ),
    ],
  );
}

class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y; // important data
  final Color color;

  const Data({
    @required this.name,
    @required this.id,
    @required this.y,
    @required this.color,
  });
}

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        margin: 10,
        getTitles: (double id) => BarData.barData
            .firstWhere((element) => element.id == id.toInt())
            .name,
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        interval: BarData.interval.toDouble(),
        margin: 10,
        reservedSize: 30, // space from left
        rotateAngle: 90, // Side title text rotation
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
      );
}

class BarData {
  static int interval = 5; // interval gap between side numbers

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Mon',
      y: 15,
      color: Color(0xff19bfff),
    ),
    Data(
      id: 1,
      name: 'Tue',
      y: 12,
      color: Color(0xffff4d94),
    ),
    Data(
      id: 2,
      name: 'Wed',
      y: 11,
      color: Color(0xff2bdb90),
    ),
    Data(
      id: 3,
      name: 'Thu',
      y: 13,
      color: Color(0xff19bfff),
    ),
    Data(
      id: 4,
      name: 'Fri',
      y: 17,
      color: Color(0xff19bfff),
    ),
    Data(
      id: 5,
      name: 'Sat',
      y: 15,
      color: Color(0xff19bfff),
    ),
    Data(
      id: 6,
      name: 'Sun',
      y: 10,
      color: Color(0xff19bfff),
    ),
  ];
}
