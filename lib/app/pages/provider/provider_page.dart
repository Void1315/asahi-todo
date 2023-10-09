import "package:asahi_todo/app/state/home_state.dart";
import "package:asahi_todo/core/logger/app_logger.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeState(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop(true);
              },
            ),
            title: const Text("Provider Page"),
          ),
          body: Center(
              child: Column(children: [
            const AWidget(),
            const BWidget(),
            Consumer<HomeState>(
              child: const AWidget(),
              builder: (context, homeState, child) {
                return Column(children: [
                  if (child != null) child,
                  CWidget(homeState: homeState)
                ]);
              },
              
            )
          ])),
        ));
  }
}

class AWidget extends StatelessWidget {
  const AWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLogger.log("AWidget build", logType: LogType.debug);

    return Consumer<HomeState>(builder: (context, homeState, child) {
      return Container(
        child: Column(children: [
          Text(homeState.fontSize.toString()),
          ElevatedButton(
              onPressed: () {
                homeState.fontSize = homeState.fontSize + 1;
              },
              child: const Text("加一"))
        ]),
      );
    });
  }
}

// ignore: must_be_immutable
class CWidget extends StatelessWidget {
  late HomeState homeState;

  CWidget({required this.homeState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLogger.log("CWidget build", logType: LogType.debug);
    return Column(children: [
      Text(homeState.fontSize.toString()),
      ElevatedButton(
          onPressed: () {
            homeState.fontSize = homeState.fontSize + 1;
          },
          child: const Text("c加一"))
    ]);
  }
}

class BWidget extends StatelessWidget {
  const BWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLogger.log("BWidget build", logType: LogType.debug);

    return Consumer<HomeState>(builder: (context, homeState, child) {
      return Container(
        child: Column(children: [
          Text(homeState.fontSize.toString()),
          ElevatedButton(
              onPressed: () {
                homeState.fontSize = homeState.fontSize + 1;
              },
              child: const Text("加一"))
        ]),
      );
    });
  }
}
