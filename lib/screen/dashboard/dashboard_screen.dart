import 'package:ecommerce_task/common/widgets/buildPage.dart';
import 'package:ecommerce_task/common/widgets/imageslider.dart';
import 'package:ecommerce_task/helper/cart_helper.dart';
import 'package:ecommerce_task/screen/product_details/product_details.dart';
import 'package:ecommerce_task/utill/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }
Future<List<dynamic>> fetchProducts() async {
    final data = await CartHelper.fetchProducts();
    print("data-:$data");

    return data;
}
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(backgroundColor: alternateColor,child:Icon(Icons.dehaze) ,),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(backgroundColor: alternateColor,child:Icon(Icons.notifications_none) ,),
          ),


        ],
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: SizedBox(
                height: 50,
                child: TextField(

                  decoration: InputDecoration(

                    suffix: Icon(Icons.read_more),

                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    fillColor: alternateColor,
                    filled: true,
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                    enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none),

                  ),
                  onChanged: (value) {},
                  
                ),
              ),
            ),
            // PageView for image slider
            Padding(
              padding: const EdgeInsets.all(10),
              child: ImageSlider(imageUrls: [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU',

              ]),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CircleAvatar(radius: 30,backgroundColor: Colors.blue,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10Bkim9d4RVbBQBe4WW0xyNFhxi20YQ8ie0lCOnbEj1CwE1e-bCzQbt7v25aeQPrnoN8&usqp=CAU'),),
                      ),
                      Text("Shoes")
                    ],
                  ),
                );

              },),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: title20w500(C: Colors.black),
                  ),
                  Text(
                    "See all",
                    style: title15w500(C: Colors.grey),
                  ),
                ],
              ),
            ),

FutureBuilder(future: fetchProducts(), builder: (context, snapshot) {
  // Loading state
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
  }
  // Error state
  if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
  }
  if(snapshot.hasData && snapshot.data != null){
    var postDataList = snapshot.data;
    print("snapshot data: ${snapshot.data}");
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true, // Makes the GridView shrink to fit content
        physics: NeverScrollableScrollPhysics(),
        itemCount: postDataList!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in grid
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 220,
        ),
        itemBuilder: (context, index) {
          return InkWell(onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetails(productDetail: postDataList[index])),
            );
          },
            child: Container(
              decoration: BoxDecoration(
                color: primaryBackgroundColor, // Set your background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Align(alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft:Radius.circular(5) ),color: primaryColor),
                      child:Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.favorite_border,color: white,size: 18,),
                      ),
                    ),
                  ),
                  Column(
                    children: [

                      SizedBox(
                        width: 100, // Set desired width
                        height: 160, // Set desired height
                        child: Image.network(
                          '${postDataList[index]['image']}', // Replace with your image path
                          width: 100, // Set desired width
                          height: 100,
                          // Set desired height
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${postDataList[index]['title']}",
                                style: title15w500(C: black),overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${postDataList[index]['price']}",
                              style: title17w500(C: black),
                            ),
                            SizedBox(
                              width: 80,
                              height: 19,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return index == 3
                                      ? Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "+2",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ),
                                    ),
                                  )
                                      : Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        color: Colors.red,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )

            ),
          );
        },
      ),
    );
  }
  return Center(child: Text('No posts available'));
},),

          ],
        ),
      ),


    );
  }
}
