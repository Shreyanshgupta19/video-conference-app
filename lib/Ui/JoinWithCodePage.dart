import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:video_conference/Ui/VideoCallPage.dart';

class JoinWithCodePage extends StatefulWidget {
  const JoinWithCodePage({super.key});

  @override
  State<JoinWithCodePage> createState() => _JoinWithCodePageState();
}

class _JoinWithCodePageState extends State<JoinWithCodePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios_new_sharp,size: 35,)),
              ),
              const SizedBox(height: 50,),
              SvgPicture.asset('assets/images/meeting_icon.svg',color: Colors.indigo, height: 100, fit: BoxFit.cover,),
              const SizedBox(height: 50,),
              const Text('Enter meeting code below',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              Padding(
                padding: EdgeInsets.only(left: 15,top: 20, right: 15, bottom: 20),
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Example: abc-def-ghi'
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  // Get.toNamed('/VideoCallPage');
                  if(controller.text.trim().isNotEmpty){
                    Get.to(VideoCallPage(channelName: controller.text.trim(),));
                  }else{
                    Fluttertoast.showToast(
                      msg: 'Please enter code',
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  }

                },
                child: Text('Join',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  fixedSize: Size(100, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
