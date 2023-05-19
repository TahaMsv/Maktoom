import 'package:negarestan/core/constants/apis.dart';
import 'package:negarestan/screens/profile/profile_repository.dart';
import 'package:negarestan/screens/profile/profile_state.dart';
import 'package:negarestan/screens/profile/usecases/me_usecase.dart';

import '../../core/classes/user.dart';
import '../../core/constants/route_names.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';
import '../home/home_state.dart';
import 'package:dio/dio.dart';

class ProfileController extends MainController {
  final ProfileState profileState = getIt<ProfileState>();
  final ProfileRepository profileRepository = getIt<ProfileRepository>();

  late MeUseCase meUseCase = MeUseCase(repository: profileRepository);

  // void me() async {
  //   if (!profileState.isLoading) {
  //     profileState.setIsLoading(true);
  //     MeRequest meRequest = MeRequest();
  //     final fOrMe = await meUseCase(request: meRequest);
  //     print("here65");
  //     fOrMe.fold((f) => FailureHandler.handle(f, retry: () => me()), (user) async {
  //       final HomeState homeState = getIt<HomeState>();
  //       homeState.setUser(user);
  //       nav.goToName(RouteNames.projects);
  //     });
  //   }
  //   profileState.setIsLoading(false);
  // }

  void me(String token) async {
    if (!profileState.isLoading) {
      profileState.setIsLoading(true);
      final dio = Dio();
      dio.options.headers["Authorization"] = "Token $token";
      final response = await dio.get(Apis.baseUrl + Apis.me);
      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        final HomeState homeState = getIt<HomeState>();
        homeState.setUser(user);
        nav.goToName(RouteNames.projects);
      }
    }
    profileState.setIsLoading(false);
  }

  @override
  void onCreate() {}
}
