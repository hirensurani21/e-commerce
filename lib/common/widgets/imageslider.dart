import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;
  final Duration autoSlideDuration;

  ImageSlider({
    required this.imageUrls,
    this.autoSlideDuration = const Duration(seconds: 3),
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatically change pages after the set duration
    Future.delayed(widget.autoSlideDuration, autoChangePage);
  }

  void autoChangePage() {
    if (_pageController.hasClients) {
      setState(() {
        currentPage = (currentPage + 1) % widget.imageUrls.length;
        _pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
      Future.delayed(widget.autoSlideDuration, autoChangePage); // Repeat auto-change
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: widget.imageUrls.map((url) => buildPage(url)).toList(),
          ),
          // SmoothPageIndicator below the PageView
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: widget.imageUrls.length, // Number of pages
                  effect:ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.black,
                    dotColor: Colors.grey.shade300,
spacing: 3,
expansionFactor: 2,
                    paintStyle: PaintingStyle.fill
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each page
  Widget buildPage(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
