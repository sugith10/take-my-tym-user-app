import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'dart:async';

import 'package:take_my_tym/core/widgets/take_my_tym_info_dialog.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

Timer? _timer;

class _BannerWidgetState extends State<BannerWidget> {
  final images = <String>[
    MyAppImages.adOne,
    MyAppImages.adTwo,
    MyAppImages.adThree,
    MyAppImages.adFour,
  ];

  late List<Widget> pages;

  int activePage = 0;

  final PageController pageController = PageController(initialPage: 0);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.page == images.length - 1) {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pages = List.generate(
      images.length,
      (index) => _ImagePlaceholder(imagePath: images[index]),
    );
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TakeyMyTymDailog().show(context: context);
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
              onPageChanged: (value) {
                setState(() {
                  activePage = value;
                });
              },
            ),
          ),
          //code for page indicator
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: activePage == index
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final String imagePath;
  const _ImagePlaceholder({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
