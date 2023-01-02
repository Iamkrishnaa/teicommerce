import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MessagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
