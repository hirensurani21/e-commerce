




import 'package:ecommerce_task/screen/dashboard/dashboard_screen.dart';
import 'package:ecommerce_task/screen/login/login_screen.dart';

import '../../utill/header.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variable to control opacity
  double _opacity = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Start the fade-in animation
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0; // Change opacity to fully visible
      });
    });

    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity, // Control opacity with the variable
              duration: Duration(seconds: 2), // Duration of the fade-in effect
                child: Image.asset(
                  ImagePath.appLogo, // Replace with your logo image path
                  width: 150, // Set desired width
                  height: 150, // Set desired height
                ),
            ),
            Text("E-commerce app",style: title20w500(C: primaryColor),)
          ],
        ),
      ),

    );
  }
}
