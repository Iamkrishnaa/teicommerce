import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
