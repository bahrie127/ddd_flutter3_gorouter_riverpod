import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';

class AccountScreenController extends StateNotifier<AsyncValue> {
  final FakeAuthRepository authRepository;
  AccountScreenController({
    required this.authRepository,
  }) : super(const AsyncValue.data(null));

  Future<void> signOut() async {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(
    authRepository: authRepository,
  );
});
