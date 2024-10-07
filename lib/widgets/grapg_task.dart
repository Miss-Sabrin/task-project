import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package
import 'package:flutter/material.dart';

class GrapgTask extends StatelessWidget {
  GrapgTask({super.key});

  // List of days that will be used in both sections (top and bottom)
  final List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 0.1, // Spread of the shadow
                  blurRadius: 0, // Softness of the shadow
                  offset: Offset(0, 0), // Position of the shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Daily tasks overview',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text('11/23/3333'),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: 12,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 6,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: 10,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 9,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 14,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 11,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 7,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 12,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 10,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: 15,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 12,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: 12,
                                color: Colors.brown,
                              ),
                              BarChartRodData(
                                toY: 9,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ],
                        borderData: FlBorderData(
                          show: false, // Disable the border around the chart
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true, // Enable X-axis titles
                              getTitlesWidget: (value, meta) {
                                // Use the same days list to show days in the X-axis
                                if (value.toInt() < days.length) {
                                  return Text(days[value.toInt()]);
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                // Show only 0, 2, 5, 8
                                if (value == 0) {
                                  return const Text('0');
                                } else if (value == 2) {
                                  return const Text('2');
                                } else if (value == 5) {
                                  return const Text('5');
                                } else if (value == 8) {
                                  return const Text('8');
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false, // Hide right axis titles
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false, // Hide top axis titles
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            color: Colors.brown,
                          ),
                          const SizedBox(width: 4),
                          const Text('Complete'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          const Text('Ongoing'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 230,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  spreadRadius: 0.3, // Spread of the shadow
                  blurRadius: 0, // Softness of the shadow
                  offset: Offset(0, 0), // Position of the shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Daily tasks overview',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Weekly',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Avg project daily 5',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // LineChart section here
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 10),
                              FlSpot(1, 20.5),
                              FlSpot(2, 18.5),
                              FlSpot(3, 30.5),
                              FlSpot(4, 11.9),
                              FlSpot(5, 15),
                              FlSpot(6, 30),
                              FlSpot(7, 28),
                            ],
                            isCurved: true,
                            color:
                                Colors.orange, // Change to color (not colors)
                            barWidth: 2,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange.withOpacity(0.2),
                                  Colors.orange.withOpacity(0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ), // Light orange under the line
                            ),
                          ),
                        ],
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(
                          show: false,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                // Use the same days list to show days in the X-axis for LineChart
                                if (value.toInt() < days.length) {
                                  return Text(days[value.toInt()]);
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true, // Show only 0, 2, 5, 8
                              getTitlesWidget: (value, meta) {
                                if (value == 9) {
                                  return const Text('0');
                                } else if (value == 2) {
                                  return const Text('2');
                                } else if (value == 5) {
                                  return const Text('5');
                                } else if (value == 8) {
                                  return const Text('8');
                                }
                                return const Text('0');
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false, // Hide right axis titles
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false, // Hide top axis titles
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
