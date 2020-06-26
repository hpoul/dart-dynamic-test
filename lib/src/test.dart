import 'package:dart_dynamic_test/test.dart';

abstract class GenericClass<T> {
  T foo();
}

class IntClass extends GenericClass<int> {
  @override
  int foo() => 42;
}

extension GenericClassExt<T> on Future<GenericClass<T>> {
  Future<T> resolve() => then((value) => value.foo());
}

Future<IntClass> produce() => Future.value(IntClass());

Future<void> main() async {
  final wrapper = produce();
  wrapper.resolve();
  final val = await wrapper.resolve();
  print('val: $val');
}
