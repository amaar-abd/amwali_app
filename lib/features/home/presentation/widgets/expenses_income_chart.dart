import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpensesIncomeChart extends StatelessWidget {
  const ExpensesIncomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    double totalIncome = 45200;
    double totalExpenses = 12840;

    double sum = totalIncome + totalExpenses;
    double incomePercentage = (totalIncome / sum) * 100;
    double expensePercentage = (totalExpenses / sum) * 100;

    Map<String, double> dataMap = {
      "الدخل": totalIncome,
      "المصروف": totalExpenses,
    };

    List<Color> colorList = [Colors.green, Colors.red];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'هيكل الميزانية الشهري',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 16,
                  chartRadius: MediaQuery.of(context).size.width / 2.8,
                  legendOptions: const LegendOptions(showLegends: false),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: false,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'الصافي',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      (totalIncome - totalExpenses).toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'الدخل (${incomePercentage.toStringAsFixed(0)}%)',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'المصروف (${expensePercentage.toStringAsFixed(0)}%)',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
