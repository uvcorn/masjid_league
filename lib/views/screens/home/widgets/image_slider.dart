import 'package:flutter/material.dart';
import 'package:mojid/utils/app_strings/app_strings.dart';
import 'package:mojid/views/components/custom_text/custom_text.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(viewportFraction: 1);
  int _currentPage = 0;

  final List<String> sliderImages = [
    AppImages.footballMatch1,
    AppImages.footballMatch2,
    AppImages.footballMatch1,
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _nextPage() {
    if (_currentPage < sliderImages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // Never scroll
            itemCount: sliderImages.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_pageController.position.haveDimensions) {
                    scale = 1.0 - (_pageController.page! - index).abs() * 0.1;
                    if (scale < 0.8) scale = 0.8;
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeOut.transform(scale) * 200,
                      width:
                          Curves.easeOut.transform(scale) *
                          MediaQuery.of(context).size.width *
                          _pageController.viewportFraction,
                      child: child,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(sliderImages[index], fit: BoxFit.cover),
                        Container(
                          color: AppColors.secPrimary.withOpacity(
                            _currentPage == index ? 0.5 : 0.7,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: AppStrings.sTrengthOnUnity,
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: AppStrings.focusedOnThePitch,
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          Positioned(
            left: 10,
            top: 80, // Center vertically
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: _previousPage,
            ),
          ),

          Positioned(
            right: 10,
            top: 80, // Center vertically
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: _nextPage,
            ),
          ),
        ],
      ),
    );
  }
}
