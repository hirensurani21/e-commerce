import 'package:ecommerce_task/screen/bottom_bar/bottom_bar.dart';
import 'package:ecommerce_task/screen/dashboard/dashboard_screen.dart';
import 'package:ecommerce_task/utill/extension.dart';

import '../../utill/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void dispose() {
    _userFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset(
                ImagePath.appLogo, // Replace with your logo image path
                width: 150, // Set desired width
                height: 150, // Set desired height
              ),
              Text("Login",style: AppTextStyle(fontSize: 35, fontWeight: FontWeight.w500,color: primaryColor),),

              SizedBox(height: 50,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Email*:",style: title15w500(),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: TextFormField(
                  focusNode: _userFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    _fieldFocusChange(context, _userFocusNode, _passwordFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a email';
                    }
                    if (!value.isValidEmail) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.alternate_email),
                    filled: true,
                    fillColor: Colors.white,
                    // labelText: 'Email',
                    hintText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red,width: 2)
                    ),

                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.black,width: 1.5) ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)
                    ),


                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Password*:",style: title15w500(),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: TextFormField(
                  focusNode: _passwordFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {},

                  onChanged: (value) {},

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Password';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.alternate_email),
                    filled: true,
                    suffixIcon: Icon(Icons.visibility,),

                    counterText: "ForgetPassword",
                    counterStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,

                    hintText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red,width: 2)
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.black,width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)
                    ),
                    // Adjust the padding as needed
                    //hintText: 'name@gmail.com',
                  ),
                ),
              ),
              SizedBox(height: 50,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(250.w, 50.h), backgroundColor: primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BottomBar()),
                  );
                } else {

                  // Find the first invalid field and set focus to it
                  if (email.text.isEmpty || email.text.isValidEmail) {
                    FocusScope.of(context).requestFocus(_userFocusNode);
                  } else if (password.text.isEmpty) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  }
                }

              }, child: Text("Login",style: title20w500(C: white),))

            ],
          ),
        ),
      ),
    );
  }
}
