import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/weather.dart';
import '../models/weatile.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_tile.dart';

class WeatherDetailsPage extends StatelessWidget {
  WeatherDetailsPage({super.key, required this.weathers});
  var gradient = RadialGradient(
    colors: [
      Color(0xFFf0f4f6),
      Color(0xFFc3cdd8),
    ],
  );
  List<Weatile> weathers;
  var pageController = PageController();
  RxInt indexed = 0.obs;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: 1000.milliseconds,
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Obx(() {
                return AnimatedContainer(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: weathers[indexed.value].gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  duration: 1000.milliseconds,
                  child: PageView.builder(
                    itemCount: 4,
                    onPageChanged: (value) {
                      print(value);
                      indexed.value = value;
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: FadeIn(
                              duration: 2000.milliseconds,
                              delay: 1000.milliseconds,
                              child: CustomText(
                                text: weathers[index].location,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FadeIn(
                            duration: 1000.milliseconds,
                            child: CustomText(
                              text: 'Today, 31 Jan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SlideInRight(
                              duration: 1000.milliseconds,
                              from: 300,
                              child: Image.asset(
                                weathers[index].icon,
                                height: 300,
                              )),
                          FadeIn(
                            duration: 3000.milliseconds,
                            child: CustomText(
                              text: weathers[index].degree,
                              style: TextStyle(
                                  color: Color(0xFFf0f4f6),
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FadeInDown(
                            duration: 1000.milliseconds,
                            from: 100,
                            child: CustomText(
                              text: weathers[index].weather,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Obx(() {
                            return SlideInRight(
                              duration: 1000.milliseconds,
                              from: 300,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: indexed.value == 2
                                        ? Color(0xFFdc9938).withOpacity(0.4)
                                        : weathers[index]
                                            .gradient
                                            .last
                                            .withOpacity(0.5),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InfoTile(
                                          title: 'UV INDEX',
                                          icon: Icons.light_mode,
                                          value: '2',
                                          color: Colors.yellow[700]!,
                                          isColor:
                                              indexed.value == 2 ? true : false,
                                        ),
                                        VerticalDiv(),
                                        InfoTile(
                                          isColor:
                                              indexed.value == 2 ? true : false,
                                          title: 'WIND',
                                          color: Color(0xFF6a7dba),
                                          icon: Icons.air_rounded,
                                          value: '5 m/s',
                                        ),
                                        VerticalDiv(),
                                        InfoTile(
                                          title: 'HUMIDITY',
                                          color: Color(0xFF309af8),
                                          icon: Icons.water_drop,
                                          value: '71%',
                                          isColor:
                                              indexed.value == 2 ? true : false,
                                        ),
                                      ]),
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          SlideInRight(
                            duration: 1000.milliseconds,
                            from: 400,
                            delay: 500.milliseconds,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Obx(() {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: indexed.value == 2
                                        ? Color(0xFFdc9938).withOpacity(0.4)
                                        : weathers[index]
                                            .gradient
                                            .last
                                            .withOpacity(0.8),
                                    // .withOpacity(0.8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoTile2(
                                        time: 'NOW',
                                        degre: '13°',
                                        icon: 'assets/images/sunrain.png',
                                      ),
                                      InfoTile2(
                                        time: '2:00 PM',
                                        degre: '16°',
                                        icon: 'assets/images/mooncloud.png',
                                      ),
                                      InfoTile2(
                                        time: '6:00 PM',
                                        degre: '16°',
                                        icon: 'assets/images/mooncloud.png',
                                      ),
                                      InfoTile2(
                                        time: '3:00 PM',
                                        degre: '16°',
                                        icon: 'assets/images/mooncloud.png',
                                      ),
                                      InfoTile2(
                                        time: '3:00 PM',
                                        degre: '12°',
                                        icon: 'assets/images/sun.png',
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Obx(() {
                  return AnimatedSmoothIndicator(
                    activeIndex: indexed.value,
                    count: 4,
                    effect: WormEffect(
                        dotColor: Color(0xFFf1f3f6),
                        activeDotColor: Color(0xFF6cb7ff),
                        dotHeight: 12,
                        dotWidth: 12),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}





class BouncingButton extends StatefulWidget {
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(
      begin: 0.1,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves
            .elasticInOut, // Utilisez une courbe d'élasticité pour simuler le rebondissement
      ),
    );
    _animationController!.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _handleTap() {
    _animationController!.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Transform.scale(
        scale: 1.0 +
            _animation!
                .value, // Appliquer une échelle en fonction de la valeur de l'animation
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blue,
          child: Text(
            'Appuyez ici',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ))
        ),
      ),
    );
  }
}
