# asahi_todo

A new Flutter project.

## 起步

- 生成依赖注入配置

```
flutter packages pub run build_runner build
```

- 持续生成依赖注入配置
```
flutter packages pub run build_runner watch
```

- 在终端中运行此命令以查看自动更改并删除以前的 g.dart 文件
```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

- 关联您的生产环境firebase项目
```
flutterfire configure
```

- 关联您的dev环境的firebase项目

```
flutterfire configure --out lib/firebase_options_dev.dart
```