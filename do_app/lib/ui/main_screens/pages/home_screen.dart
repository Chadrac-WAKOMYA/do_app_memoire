import 'package:do_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Inscrits": 5,
      "Filles": 3,
      "Garçons": 2,
      "Solvables": 4.5,
    };
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akili Ni Mali ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'School ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  Material(
                    // elevation: 1,
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: Image(
                            height: 50,
                            width: 50,
                            // height: MediaQuery.of(context).size.width * .3/2,
                            // width: MediaQuery.of(context).size.width * .3/2,
                            image: AssetImage('lib/assets/school_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Constant.secondColor,
                    //   borderRadius: BorderRadius.circular(8.0),
                    //   boxShadow: const [
                    //     BoxShadow(
                    //       color: Colors.green.withOpacity(0.5),
                    //       // color: Constant.secondColor,
                    //       spreadRadius: 10,
                    //       blurRadius: 10,
                    //       offset: Offset(0, 3),
                    //     ),
                    //   ],
                    // ),
                    color: Constant.secondColor,
                    height: MediaQuery.of(context).size.width * .5,
                    // width: MediaQuery.of(context).size.width * .9/2,
                    child: Row(
                      children: [
                        PieChart(dataMap: dataMap),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        coolCard(
                            context: context,
                            color: Constant.mainColor,
                            title: 'SECTION',
                            subtitle: 'Section(s)',
                            number: '4',
                            icon: Icons.book_online_rounded),
                        const SizedBox(
                          height: 20,
                        ),
                        coolCard(context: context, color: Constant.mainColor),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        coolCard(
                            context: context, color: Colors.yellow),
                        const SizedBox(
                          height: 20,
                        ),
                        coolCard(
                            context: context, color: Constant.mainColor),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.yellow,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              // SimpleTimeSeriesChart.withSampleData(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget coolCard(
    {context,
    color = Constant.mainColor,
    title = 'Aucun',
    subtitle = 'Aucun',
    number = '12',
    icon = Icons.book}) {
  return Container(
    color: color,
    height: MediaQuery.of(context).size.width * .5 / 2,
    width: MediaQuery.of(context).size.width * .9 / 2,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

// class SimpleTimeSeriesChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   SimpleTimeSeriesChart(this.seriesList, {required this.animate});

//   /// Creates a [TimeSeriesChart] with sample data and no transition.
//   factory SimpleTimeSeriesChart.withSampleData() {
//     return SimpleTimeSeriesChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return charts.TimeSeriesChart(
//       seriesList,
//       animate: animate,
//       // Optionally pass in a [DateTimeFactory] used by the chart. The factory
//       // should create the same type of [DateTime] as the data provided. If none
//       // specified, the default creates local date time.
//       dateTimeFactory: const charts.LocalDateTimeFactory(),
//     );
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
//     final data = [
//       TimeSeriesSales(DateTime(2017, 9, 19), 5),
//       TimeSeriesSales(DateTime(2017, 9, 26), 25),
//       TimeSeriesSales(DateTime(2017, 10, 3), 100),
//       TimeSeriesSales(DateTime(2017, 10, 10), 75),
//     ];

//     return [
//       charts.Series<TimeSeriesSales, DateTime>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (TimeSeriesSales sales, _) => sales.time,
//         measureFn: (TimeSeriesSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample time series data type.
// class TimeSeriesSales {
//   final DateTime time;
//   final int sales;

//   TimeSeriesSales(this.time, this.sales);
// }