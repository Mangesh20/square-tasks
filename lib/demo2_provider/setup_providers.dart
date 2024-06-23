import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:square_notes/demo2_provider/counter.dart';

class FutureInt {
  final int value;
  FutureInt(this.value);
}

class StreamInt {
  final int value;
  StreamInt(this.value);
}

Future<FutureInt> fetchInitialValue() async {
  await Future.delayed(const Duration(seconds: 2));
  return FutureInt(100);
}

Stream<StreamInt> streamValue() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield StreamInt(DateTime.now().second);
  }
}

List<SingleChildWidget> setupProviders() {
  return [
    ChangeNotifierProvider(create: (_) => Counter()),
    FutureProvider<FutureInt>(
      create: (_) => fetchInitialValue(),
      initialData: FutureInt(0),
    ),
    StreamProvider<StreamInt>(
      create: (_) => streamValue(),
      initialData: StreamInt(0),
    ),
  ];
}
