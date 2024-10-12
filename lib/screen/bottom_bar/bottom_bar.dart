import 'package:ecommerce_task/screen/dashboard/dashboard_screen.dart';
import 'package:ecommerce_task/utill/header.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  // Pages corresponding to each bottom navigation tab
  final List<Widget> _pages = [
    DashboardScreen(),
    Center(child: Text('Search Page')),
    Center(child: Text('Cart Page')),
    Center(child: Text('Favorites Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      // Main body content based on _currentIndex
      body: Container(child:_pages[_currentIndex] ,),

      // Centered FloatingActionButton
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
        child: Icon(Icons.home,color:_currentIndex == 0? white:bgColor,),
        backgroundColor: Colors.orange, // Color of the button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BottomNavigationBar with transparent effect
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Makes a notch for FAB
        notchMargin: 8.0,
        color: Colors.white, // Color of the BottomNavigationBar
        child: Container(
          height: 60.0,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
IconButton(
  icon: Icon(Icons.dashboard_customize_outlined ,color:_currentIndex == 1? black:grey, ),
  onPressed: () {
    setState(() {
      _currentIndex = 1;
    });
  },
),
 // Space for the FloatingActionButton
IconButton(
  icon: Icon(Icons.favorite_border,color:_currentIndex == 2? black:grey,),
  onPressed: () {
    setState(() {
      _currentIndex = 2;
    });
  },
),
              SizedBox(width: 40),
              IconButton(
  icon: Icon(Icons.shopping_cart_outlined,color:_currentIndex == 3? black:grey,),
  onPressed: () {
    setState(() {
      _currentIndex = 3;
    });
  },
),
IconButton(
  icon: Icon(Icons.person_outline_outlined,color:_currentIndex == 4? black:grey,),
  onPressed: () {
    setState(() {
      _currentIndex = 4;
    });
  },
)


            ],
          ),
        ),
      ),
    );
  }
}
