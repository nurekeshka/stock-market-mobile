import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF1C1F26) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Donut Chart
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 40,
                    sections: _buildPieSections(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Legend
            _buildLegend(isDark),

            const SizedBox(height: 10),

            // Gains
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gain\n367 €",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                const SizedBox(width: 20),
                Text(
                  "IRR\n15,50%",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              "Value on 01.06.2025 : 0,00€",
              style: TextStyle(color: textColor),
            ),
            Text("Investment: 3412,42 €", style: TextStyle(color: textColor)),

            const SizedBox(height: 20),

            Text(
              "Performance over time",
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Bar Chart
            SizedBox(
              height: 150,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 60,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                          return Text(
                            months[value.toInt()],
                            style: TextStyle(color: textColor),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barGroups: _buildBarGroups(isDark),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(bool isDark) {
    final barColor = isDark ? Colors.cyanAccent : Colors.blue;
    final values = [5, 20, 15, 45, 30];

    return List.generate(values.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i].toDouble(),
            color: barColor,
            width: 16,
          ),
        ],
      );
    });
  }

  Widget _buildLegend(bool isDark) {
    final labels = [
      {'label': 'Tech', 'color': Colors.green, 'value': '25%'},
      {'label': 'Energy', 'color': Colors.blue, 'value': '20%'},
      {'label': 'Health Care', 'color': Colors.teal, 'value': '18%'},
      {'label': 'Financials', 'color': Colors.orange, 'value': '15%'},
      {'label': 'Real Estate', 'color': Colors.yellow, 'value': '10%'},
      {'label': 'Industrials', 'color': Colors.purple, 'value': '12%'},
    ];

    return Column(
      children:
          labels
              .map(
                (item) => Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      color: item['color'] as Color,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${item['label']} - ${item['value']}',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
    );
  }

  List<PieChartSectionData> _buildPieSections() {
    return [
      PieChartSectionData(color: Colors.green, value: 25, title: ''),
      PieChartSectionData(color: Colors.blue, value: 20, title: ''),
      PieChartSectionData(color: Colors.teal, value: 18, title: ''),
      PieChartSectionData(color: Colors.orange, value: 15, title: ''),
      PieChartSectionData(color: Colors.yellow, value: 10, title: ''),
      PieChartSectionData(color: Colors.purple, value: 12, title: ''),
    ];
  }
}
