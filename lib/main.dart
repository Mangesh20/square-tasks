import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleDarkTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      isDarkTheme: _isDarkTheme,
      child: MaterialApp(
        theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Stateful Widget Lifecycle Demo'),
          ),
          body: LifecycleDemo(count: 0),
          floatingActionButton: FloatingActionButton(
            onPressed: _toggleDarkTheme,
            child: const Icon(
              Icons.brightness_6_outlined,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LifecycleDemo extends StatefulWidget {
  int count;
  LifecycleDemo({Key? key, required this.count}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    if (kDebugMode) {
      print('widget created : ${++count}');
    }
    return _LifecycleDemoState();
  }
}

class ThemeSwitcher extends InheritedWidget {
  final bool isDarkTheme;

  const ThemeSwitcher({
    Key? key,
    required this.isDarkTheme,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ThemeSwitcher oldWidget) {
    return oldWidget.isDarkTheme != isDarkTheme;
  }

  static ThemeSwitcher? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  late int count;
  @override
  void initState() {
    super.initState();
    count = widget.count;
    if (kDebugMode) {
      print('widget initiated : ${++count}');
    }
  }

  @override
  void didUpdateWidget(covariant LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print('widget didUpdateWidget called : ${++count}');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print('widget didChangeDependencies called : ${++count}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('widget build : ${++count}');
    }
    final isDarkTheme = ThemeSwitcher.of(context)!.isDarkTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (kDebugMode) {
                  print(' widget set state called : ${++count}');
                }
              });
            },
            child: Text('Theme is Dark: $isDarkTheme \n State Refresh $count'),
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print('widget deactivated : ${++count}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('widget disposed : ${++count}');
    }
  }
}
