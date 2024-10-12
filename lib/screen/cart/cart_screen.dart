import 'package:ecommerce_task/utill/header.dart';

    class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> num = List<int>.filled(10, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alternateColor,
      appBar: AppBar(
        backgroundColor: alternateColor,
        leading: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: CircleAvatar(radius: 20,backgroundColor: white,child:Center(child: Icon(Icons.arrow_back,size: 20,)) ,),
        ),
        title: Text("My Cart"),centerTitle: true,

      ),

      body: Stack(children: [

        ListView.builder(itemCount: 10,itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color:alternateColor ,
                            borderRadius: BorderRadius.circular(15)),

                        child: Image.asset(ImagePath.appLogo,height: 50,width: 50,),),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        Container(
                          width: 280.w,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Woman Sweter",style: title18w600(C: black)), Icon(Icons.delete_forever_outlined,color: primaryColor,)
                            ],
                          ),
                        ),
                        Text("Woman fashion"),
                        Container(
                          width: 290.w,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$70.0",style: title18w600(C: black),),
                              SizedBox(width: 150.w,),

                              Container(
                                decoration: BoxDecoration(color: alternateColor,borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                                  child: Row( children: [
                                    InkWell(onTap: () {
                                      if(num[index]>1){
                                        num[index]--;
                                      }
                                      setState(() {

                                      });
                                    },child: Icon(Icons.remove,color: black,)),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("${num[index]}",style: title17w400(C: black),),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            num[index]++;
                                          });
                                        },
                                        child: Icon(Icons.add,color: black,)),
                                  ],),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),


            ),
          );
        },),
        Align(alignment:Alignment.bottomCenter,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child:Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color:alternateColor ,
                        borderRadius: BorderRadius.circular(30),),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Enter Discount Code",style:title17w500(C:grey ) ,),
                          Text("Apply",style: title18w600(C: primaryColor),),
                        ],),
                      ),
                    ),
                  ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",style:  title18w600(C: Colors.grey),),
                      Text("\$224.oo",style: title18w500(C: black),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style:  title18w600(C: Colors.grey),),
                      Text("\$224.oo",style: title18w500(C: black),),
                    ],
                  ),
                ),
                SizedBox(height: 40.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor
                    ),
                    child:Center(child: Text("Checkout",style: title18w500(C: white))),
                  ),
                )
              ],
            ),
          ),
        )
      ],

      ),


    );
  }
}
