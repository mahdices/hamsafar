import 'package:flutter/material.dart';
import 'package:hamsafar/appconfig.dart';
import 'package:hamsafar/components/currency_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);
  List<_SalesData> data = [
    _SalesData('امروز', 35),
    _SalesData('دیروز', 28),
    _SalesData('۵ آذر', 34),
    _SalesData('۴ آذر', 32),
    _SalesData('۳ آذر', 60),
    _SalesData('۲ آذر', 40),
    _SalesData('۱ آذر', 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffA7E0B1),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "کیف پول",
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            expandedHeight: 350,
            // collapsedHeight: 250,
            stretch: true,
            pinned: true,
            backgroundColor: Color(0xffA7E0B1),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        "درآمد هفته اخیر",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                          borderWidth: 0,
                          borderColor: Colors.transparent,
                          primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(
                                  fontFamily: 'Dana',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              majorGridLines: MajorGridLines(width: 0),
                              axisLine: AxisLine(
                                width: 2,
                                color: Colors.white,
                              )),
                          primaryYAxis: NumericAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              isVisible: false),
                          legend: Legend(isVisible: false),
                          tooltipBehavior: TooltipBehavior(
                              enable: true,
                              color: Colors.white,
                              builder: (dynamic data,
                                  dynamic point,
                                  dynamic series,
                                  int pointIndex,
                                  int seriesIndex) {
                                return Text("200.000");
                              }),
                          series: <ChartSeries<_SalesData, String>>[
                            ColumnSeries<_SalesData, String>(
                                dataSource: data,
                                yValueMapper: (_SalesData sales, _) =>
                                    sales.sales,
                                xValueMapper: (_SalesData sales, _) =>
                                    sales.year,
                                name: 'Sales',
                                color: Color(AppConfig.primaryColor),
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            // floating: false,
            // pinned: false,
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Row(
                children: [
                  Text("موجودی"),
                  Expanded(child: CurrencyText(price: 1020000, size: 30)),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(AppConfig.primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 70,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color:index%2==0? Color(AppConfig.greenColor):Color(AppConfig.redColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              index%2==0?"افزایش":"کاهش",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CurrencyText(price: 35000, size: 18),
                          Spacer(),
                          Text("۵ تیر ۱۴۰۰ • ۱۴:۳۰",style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "بابت سفر کد ۲۳۹۲۸۴",
                        style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider()
                    ],
                  ));
            }, childCount: 200),
          )
        ],
      ),
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
