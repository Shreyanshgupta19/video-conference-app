import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Video Conference'),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 0,right: 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/NewMeetingsPage');
                },
                label: Text('New Meeting',style: TextStyle(color: Colors.white),),
                icon: Icon(Icons.add,color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  fixedSize: Size(350, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),
            ),
        
            Divider(
              thickness: 1,
              height: 40,
              indent: 40,
              endIndent: 20,
            ),
        
            Padding(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 0,right: 0),
              child: OutlinedButton.icon(
                  onPressed: () {
                    Get.toNamed('/JoinWithCodePage');
                  },
                label: Text('Join with a code',style: TextStyle(color: Colors.indigo),),
                icon: Icon(Icons.margin_outlined,color: Colors.indigo,),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                    side: BorderSide(color: Colors.indigo),
                    fixedSize: Size(350, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/video_calling.json',
            height: 300,
              width: 300,
            ),
          ],
        ),
      )
    );

  }
}
