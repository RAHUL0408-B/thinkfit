import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitnest_app/common/constants/app_icon.dart';
import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import '../../../../common/widgets/custom_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40),
      ];

  List arrayProgress = [
    {'title': "6am-8am", "subtitle": "600ml"},
    {'title': "9am - 11am", "subtitle": "500ml"},
    {'title': "11am - 2pm", "subtitle": "1000ml"},
    {'title': "2pm - 4pm", "subtitle": "700ml"},
    {'title': "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            colorScheme(context).primary.withValues(alpha: 0.4),
            colorScheme(context).secondary.withValues(alpha: 0.1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: [
            colorScheme(context).primary,
            colorScheme(context).secondary
          ],
          stops: const [0.1, 0.4],
        ),
      ),
    ];
    final tooltipsOnBar = lineBarsData.first;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back,",
                      style:
                          textTheme(context).titleSmall?.copyWith(fontSize: 12),
                    ),
                    Text("Stefani Wong",
                        style: textTheme(context).bodySmall?.copyWith(
                            color: lightColorScheme.onSecondary, fontSize: 20)),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcon.notificationIcon,
                      width: 25,
                      height: 25,
                    )),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
                width: Get.width,
                height: Get.height * 0.2,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 30.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      colorScheme(context).primary,
                      colorScheme(context).secondary
                    ]),
                    image: const DecorationImage(
                      image: AssetImage(
                        AppImage.dotsImage,
                      ),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BMI (Body Mass Index)",
                            style: textTheme(context)
                                .bodyLarge
                                ?.copyWith(fontSize: 16)),
                        Text("You have a normal weight",
                            style: textTheme(context).bodyLarge?.copyWith(
                                fontSize: 11, fontWeight: FontWeight.normal)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text("View More",
                                    style: textTheme(context)
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal)),
                              )),
                        )
                      ],
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {},
                            ),
                            startDegreeOffset: 270,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 1,
                            centerSpaceRadius: 0,
                            sections: showingSections(),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
                width: Get.width,
                height: Get.height * 0.1,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffe9effe),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today Target",
                        style: textTheme(context).bodySmall?.copyWith(
                              color: lightColorScheme.onSecondary,
                            )),
                    CustomButton(
                      pressed: () {},
                      text: "Check",
                      width: Get.width * 0.35,
                      height: Get.height * 0.064,
                      gradient: LinearGradient(colors: [
                        colorScheme(context).primary,
                        colorScheme(context).secondary,
                      ]),
                      borderColor: Colors.black,
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text("Activity Status",
                style: textTheme(context).bodySmall?.copyWith(
                    color: lightColorScheme.onSecondary, fontSize: 20)),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                      color: const Color(0xffe8eefd),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Heart Rate",
                                style: textTheme(context).bodyMedium?.copyWith(
                                      fontSize: 16,
                                    )),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(colors: [
                                  colorScheme(context).primary,
                                  colorScheme(context).secondary,
                                ]).createShader(Rect.fromLTRB(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Text("78 BMI",
                                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),
                      ),
                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  const FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter: (spot, percent, barData,
                                            index) =>
                                        FlDotCirclePainter(
                                            radius: 3,
                                            color: Colors.white,
                                            strokeWidth: 3,
                                            strokeColor:
                                                colorScheme(context).surface),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipColor: (touchedSpot) =>
                                  colorScheme(context).surface,
                              tooltipRoundedRadius: 20,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} mins ago",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 140,
                          titlesData: const FlTitlesData(
                            show: false,
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: Get.height * 0.5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SimpleAnimationProgressBar(
                          height: Get.height * 0.45,
                          width: Get.width * 0.085,
                          backgroundColor: Colors.grey.shade100,
                          foregrondColor: Colors.purple,
                          ratio: 0.5,
                          direction: Axis.vertical,
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(seconds: 3),
                          borderRadius: BorderRadius.circular(15),
                          gradientColor: LinearGradient(
                              colors: [
                                colorScheme(context).primary,
                                colorScheme(context).secondary,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Expanded(
                            child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Water Intake",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: lightColorScheme.onSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(colors: [
                                  colorScheme(context).primary,
                                  colorScheme(context).secondary,
                                ]).createShader(Rect.fromLTRB(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Text("4 Liters",
                                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text("Real time updates",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: lightColorScheme.onError,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: arrayProgress.map((obj) {

                                var last =obj == arrayProgress.last;
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 4
                                          ),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  colorScheme(context).surface,
                                                  colorScheme(context).onSurface
                                                ],
                                                begin:Alignment.topLeft,
                                                end: Alignment.bottomRight
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        if(!last)
                                        DottedDashedLine(
                                            height: Get.width * 0.078,
                                            width: 0,
                                            axis: Axis.vertical,
                                          dashColor: colorScheme(context).surface,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(obj["title"].toString(),
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: lightColorScheme
                                                        .onError,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (bounds) {
                                            return LinearGradient(colors: [
                                              colorScheme(context).surface,
                                              colorScheme(context).onSurface,
                                            ]).createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                          },
                                          child: Text(
                                              obj["subtitle"].toString(),
                                              style: textTheme(context)
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }).toList(),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: Get.height * 0.22,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      Container(
                        height: Get.height * 0.22,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  List<PieChartSectionData> showingSections() {
    final gradient = LinearGradient(colors: [
      colorScheme(context).onSurface,
      colorScheme(context).surface,
    ], begin: Alignment.topRight, end: Alignment.bottomRight);
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: colorScheme(context).primary,
            value: 30,
            title: '20,1',
            radius: 70,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            gradient: gradient,
            borderSide: BorderSide.none,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 80,
            title: '',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
