import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCallPage extends StatefulWidget {
  VideoCallPage({required this.channelName});
  final String channelName;
  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  AgoraClient? _client;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    String link = 'https://81b3d0af-16b2-40d4-ad45-15c9bbac3ed6-00-10rsbrhgvf14.pike.replit.dev/access_token?channelName=${widget.channelName}';
    Response _response = await get(Uri.parse(link));
    print('Response status: ${_response.statusCode}');
    print('Response body: ${_response.body}');
    if (_response.statusCode == 200) {
      try {
        Map data = jsonDecode(_response.body);
        print("token: " + data['token']);
        _client = AgoraClient(
          agoraConnectionData: AgoraConnectionData(
            appId: '3f8c44a081d84215ad61cd350a932774',
            tempToken: data['token'] ?? '',
            channelName: widget.channelName,
          ),
          enabledPermission: [
            Permission.camera,
            Permission.microphone,
          ],
        );
        await _client?.initialize();
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print('Error parsing JSON: $e');
      }
    } else {
      print('Error: Server returned status code ${_response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
        child: Stack(
          children: [
            if (_client != null) AgoraVideoViewer(client: _client!),
            if (_client != null) AgoraVideoButtons(client: _client!),
          ],
        ),
      ),
    );
  }
}
