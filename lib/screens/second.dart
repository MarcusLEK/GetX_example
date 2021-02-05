import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/sumController.dart';

class Second extends StatelessWidget {
  final SumController sumController = Get.put(SumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GetX<SumController>(
            //   builder: (_) {
            //     print("Count 1 rebuild");
            //     return Text("Counter #1: ${_.count1.value}");
            //   },
            // ),
            // Text("                      +"),
            // GetX<SumController>(
            //   builder: (_) {
            //     print("Count 2 rebuild");
            //     return Text("Counter #1: ${_.count2.value}");
            //   },
            // ),
            // Text("                      ="),
            // GetX<SumController>(
            //   builder: (_) {
            //     print("Sum rebuild");
            //     return Text("Sum:             ${_.sum}");
            //   },
            // ),
            Obx(() {
              return Text(
                "Counter #1: ${Get.find<SumController>().count1.value}",
              );
            }),
            Text("                      +"),
            Obx(() {
              return Text(
                "Counter #2: ${Get.find<SumController>().count2.value}",
              );
            }),
            Text("                      ="),
            Obx(() {
              return Text(
                "Sum:             ${Get.find<SumController>().sum}",
              );
            }),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                sumController.increment();
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                sumController.increment2();
              },
            )
          ],
        ),
      ),
    );
  }
}
