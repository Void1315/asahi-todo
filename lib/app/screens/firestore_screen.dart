import 'package:asahi_todo/app/models/user.dart';
import 'package:asahi_todo/core/logger/app_logger.dart';
import 'package:asahi_todo/di/di.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreScreen extends StatelessWidget {
  const FirestoreScreen({Key? key}) : super(key: key);

  void queryUsers() async {
    await inject<FirebaseFirestore>().collection("users").get().then((event) {
      for (var doc in event.docs) {
        User user = User.fromJson(doc.data());
        AppLogger.log(user.toJson(), logType: LogType.debug);
      }
    });
  }

  void addUser() async {
    // 生成随机的name字符串 和 随机的age数字
    String name = "name${DateTime.now().millisecondsSinceEpoch}";
    int age = DateTime.now().millisecondsSinceEpoch % 100;
    User user = User(name: name, age: age);
    await inject<FirebaseFirestore>()
        .collection("users").add(user.toJson());
  }

  // 删除最后一条User数据
  void deleteLastUser() async {
    late User user;
    await inject<FirebaseFirestore>()
        .collection("users")
        .orderBy("age", descending: true)
        .limit(1)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        user = User.fromJson(doc.data());
        doc.reference.delete();
      }
    });
    AppLogger.log(user.toJson(), logType: LogType.debug);
  }

  // TODO 这里需要请求服务器 获取文档结果 获取之后
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Firestore")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: addUser,
                child: const Text("增加一条数据"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: deleteLastUser,
                child: const Text("删除一条数据"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: queryUsers,
                child: const Text("查询所有的用户"),
              ),
            ],
          )
        ],
      )),
    );
  }
}
