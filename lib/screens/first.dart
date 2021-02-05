import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/countController.dart';
import '../controller/userController.dart';
import 'second.dart';

class First extends StatelessWidget {
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(// rebuilds upons update at controller
                //init: CountController(), // alternate option to line 8
                builder: (_) {
              return Text("Current Count val: ${_.count}");
            }),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(
              // reactive and will update if data is updated
              init: UserController(),
              builder: (_) {
                return Text("Name: ${_.user.value.name}");
              },
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Text(
                "Stored Count: ${Get.find<UserController>().user.value.count}",
              );
            }),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Update Name & Stored Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(
                  Get.find<CountController>().count,
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Get.to(Second());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<CountController>().increment();
          }),
    );
  }
}
