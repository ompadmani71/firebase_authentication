import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_miner/helpers/firebase_auth_helper.dart';
import 'package:firebase_miner/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final blueColor = const Color(0XFF5e92f3);
  final yellowColor = const Color(0XFFfdd835);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundTopCircle(),
          buildBackgroundBottomCircle(),
          Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 50, bottom: 40),
            child: Column(
              children:  [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: ()async{
                await FirebaseAuthHelper.firebaseAuthHelper.signOut().then((value) => Get.offAll(const LoginScreen()));
              }, icon: Icon(Icons.logout,color: yellowColor,)),
              const SizedBox(width: 50),
              const Center(
                child: Text("Home Page",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
              ),
            ],
          ),
                const SizedBox(height: 100),
                Text("Email:",style: TextStyle(color: blueColor)),
                Text("${widget.currentUser.email}")
              ],
            ),
          )
        ],
      )
    );
  }
  Positioned buildBackgroundTopCircle() {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0, -MediaQuery.of(context).size.width / 1.3),
        child: Transform.scale(
          scale: 1.35,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width,
                )),
          ),
        ),
      ),
    );
  }

  Positioned buildBackgroundBottomCircle() {
    return Positioned(
      top: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.width,
      right: MediaQuery.of(context).size.width / 2,
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: yellowColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width,
            )),
      ),
    );
  }


}
