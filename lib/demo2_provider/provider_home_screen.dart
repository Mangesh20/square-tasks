// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_notes/demo2_provider/setup_providers.dart';

import './counter.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final initialValue = Provider.of<FutureInt>(context);
    final streamValue = context.watch<StreamInt>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Initial Value from FutureProvider: ${initialValue.value}'),
            Text('Current Stream Value: ${streamValue.value}'),
            Text('Counter Value: ${counter.count}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => counter.increment(),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => counter.decrement(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
