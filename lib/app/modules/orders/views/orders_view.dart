import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'OrdersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
