import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  static const routeName = '/download';
  const DownloadScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download File'),
      ),
      body: SafeArea(
        child: Text('Download File'),
      ),
    );
  }

}