import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  final FakeAuthRepository authRepository;
  AccountScreenController({
    required this.authRepository,
  }) : super(const AsyncValue<void>.data(null));

  Future<bool> signOut() async {
      state = const AsyncValue<void>.loading();
      state = await AsyncValue.guard(() => authRepository.signOut());
      state = const AsyncValue<void>.data(null);
      return state.hasError == false;
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(
    authRepository: authRepository,
  );
});
