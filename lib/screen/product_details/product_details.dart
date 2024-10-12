
import 'package:ecommerce_task/screen/cart/cart_screen.dart';
import 'package:ecommerce_task/utill/header.dart';

class ProductDetails extends StatefulWidget {
  var productDetail;
   ProductDetails( {super.key,this.productDetail});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alternateColor,
      appBar: AppBar(
        backgroundColor: alternateColor,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(backgroundColor: white,child:Center(child: Icon(Icons.arrow_back,size: 20,)) ,),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(backgroundColor: white,child:Center(child: Icon(Icons.share)) ,),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(backgroundColor: white,child:Center(child: Icon(Icons.favorite_border)) ,),
          ),


        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: alternateColor,
                  child: Image.network('${widget.productDetail['image']}'),
                ),
              ),
              Container(
                decoration: BoxDecoration(color:white,borderRadius: BorderRadius.vertical(top: Radius.circular(40),)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(height: 25.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("${widget.productDetail['title']}", style: title20w600(C: black),overflow: TextOverflow.clip,),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("\$${widget.productDetail['price']}", style: title20w600(C: black),overflow: TextOverflow.ellipsis,),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: primaryColor),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.star,color: white,size: 15,),
                                  Text("${widget.productDetail['rating']['rate']}",style: title15w500(C: white),),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("(${widget.productDetail['rating']['count']} Review)",style: title15w500(C: grey),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Color",style: title18w600(C: bgColor),),
                    ),
                    SizedBox(height: 10.h,),

                    SizedBox(
                      // width: 80,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(radius: 25,backgroundColor: Colors.red,),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Description",style: title18w600(C: bgColor),),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("${widget.productDetail['description']}",style: title15w500(C: grey)),
                    ),
                    SizedBox(height: 300.h,),
                  ],
                ),),


            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
          child: Align(alignment: Alignment.bottomCenter,
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: black,borderRadius: BorderRadius.circular(50)

              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: white)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                      child: Row( children: [
                        InkWell(onTap: () {
                          if(num>1){
                            num--;
                          }
                       setState(() {

                       });
                        },child: Icon(Icons.remove,color: white,)),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("${num}",style: title20w400(C: Colors.white),),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                num++;
                              });
                            },
                            child: Icon(Icons.add,color: white,)),
                      ],),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10  ,vertical: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CartScreen();
                      },));
                    },
                    child: Container(
                      width: 190,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                    child:Center(child: Text("Add to Cart",style: title20w500(C: Colors.white),)),

                    ),
                  ),
                )

              ],),
            ),
          ),
        )
      ],),

    );
  }
}
