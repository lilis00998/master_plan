import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulasi network delay
    return ['Keyboard', 'Mouse', 'Monitor'];
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => fetch());
  }

  Future<List<String>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Keyboard', 'Mouse', 'Monitor', 'Headset'];
  }
}

final productsProvider = AsyncNotifierProvider<ProductsNotifier, List<String>>(
  ProductsNotifier.new,
);
