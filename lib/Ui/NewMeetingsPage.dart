import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';
import 'package:uuid/uuid.dart';
import 'VideoCallPage.dart';

class NewMeetingsPage extends StatefulWidget {
  NewMeetingsPage({super.key});

  @override
  State<NewMeetingsPage> createState() => _NewMeetingsPageState();
}

class _NewMeetingsPageState extends State<NewMeetingsPage> {
  String meetingCode = 'abcdefghi';
  @override
  void initState() {
    var uuid = Uuid().v1();
    // v1 generate timebase id
    // v4 generate random id
    // v5 generate namespace-name-sha1-based id
    meetingCode = uuid.substring(0,8);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios_new_sharp,size: 35,)),
              ),
              const SizedBox(height: 50,),
              SvgPicture.asset('assets/images/new_meeting.svg', height: 100, fit: BoxFit.cover,),
              const SizedBox(height: 50,),
              const Text('Enter meeting code below',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              Padding(
                padding: EdgeInsets.only(left: 15,top: 20, right: 15, bottom: 0),
                child: Card(
                  color: Colors.grey[300],
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: SelectableText(
                      "${meetingCode}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Icon(Icons.copy),
                  )

                ),
              ),
              Divider(
                thickness: 1,
                  height: 40,
                indent: 20,
                endIndent: 20,
              ),

              ElevatedButton.icon(
                onPressed: () {
                  Share.share('Your Meeting code is: ${meetingCode.trim()}');
                },
                icon: Icon(Icons.share,color: Colors.white,size: 18,),
                label: Text('Share invite',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  fixedSize: Size(350, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),

              SizedBox(height: 20,),
              OutlinedButton.icon(
                onPressed: () {
                  Get.to(VideoCallPage(channelName: meetingCode.trim(),));
                },
                label: Text('Start call',style: TextStyle(color: Colors.indigo),),
                icon: Icon(Icons.video_call,color: Colors.indigo,),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  side: BorderSide(color: Colors.indigo),
                  fixedSize: Size(350, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),


            ],
          ),
      ),
    );
  }
}
