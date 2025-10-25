import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onBoarding.dart';
import '../components/CustomButton.dart';

// 1. Define a list of "pages" or items for the swiper
final List<Color> pageColors = [
  Colors.grey[300]!, // Placeholder 1
  Colors.grey[400]!, // Placeholder 2
  Colors.grey[500]!, // Placeholder 3
];

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  // 2. Add a PageController and a state variable for the current page
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Listen for page changes to update the indicator dots
    _pageController.addListener(() {
      if (_pageController.page != null) {
        // We use .round() because the page value can be a double during a swipe
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the whole content
              children: [
                const SizedBox(height: 50),
                // 3. Stack for PageView and the Gradient Overlay
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Stack(
                    children: [
                      // PageView for the swappable containers
                      PageView.builder(
                        controller: _pageController,
                        itemCount: pageColors.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: pageColors[index],
                                // Removed any border radius to match the design
                              ),
                              child: Center(),
                            ),
                          );
                        },
                      ),

                      // GRADIENT OVERLAY to create the soft blend effect
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50, // Height of the fade area
                            decoration: BoxDecoration(
                              // The gradient fades from the background color (Colors.white)
                              // to a fully transparent color.
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.white, // Opaque white at the bottom
                                  Colors.white.withOpacity(
                                    0.0,
                                  ), // Transparent at the top
                                ],
                                stops: const [
                                  0.0,
                                  1.0,
                                ], // Control the spread of the fade
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16), // Space between the swiper and the dots
                // 4. Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pageColors.length,
                    (index) => _buildDot(index),
                  ),
                ),

                SizedBox(height: 34), // Space between dots and text
                // --- Rest of your original content ---
                Text(
                  "Create Collects\nTimeless Artworks",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 12),
                Text(
                  "Browse and build your collection of the world's most cutting-edge digital art",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),

                // Add an Spacer to push the button to the bottom
               const Spacer(), // Use Spacer() to push everything up

                CustomButton(
                  buttonColor: Colors.deepPurpleAccent,
                  text: "Get Started",
                  textColor: Colors.white,
                  borderColor: Colors.deepPurpleAccent,
                  borderWidth: 2,
                  onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Onboarding(),
                    ),
                  );
                  },
                ),
                SizedBox(height: 24), // Bottom padding for the button
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build the indicator dots (unchanged)
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8, // Wider dot for the active page
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Colors.deepPurpleAccent
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
