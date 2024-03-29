import 'package:get_it/get_it.dart';
import 'package:negarestan/core/platform/network_info.dart';
import 'package:network_manager/network_manager.dart';

import '../screens/People/data_sources/people_remote_ds.dart';
import '../screens/People/people_controller.dart';
import '../screens/People/people_repository.dart';
import '../screens/People/people_state.dart';
import '../screens/create_post/create_post__state.dart';
import '../screens/create_post/create_post_controller.dart';
import '../screens/create_post/create_post_repository.dart';
import '../screens/create_post/data_sources/create_post_remote_ds.dart';
import '../screens/home/data_sources/home_remote_ds.dart';
import '../screens/home/home_controller.dart';
import '../screens/home/home_repository.dart';
import '../screens/home/home_state.dart';
import '../screens/login/data_sources/login_local_ds.dart';
import '../screens/login/data_sources/login_remote_ds.dart';
import '../screens/login/login_controller.dart';
import '../screens/login/login_repository.dart';
import '../screens/login/login_state.dart';
import '../screens/post_details/data_sources/post_details_remote_ds.dart';
import '../screens/post_details/post_details_controller.dart';
import '../screens/post_details/post_details_repository.dart';
import '../screens/post_details/post_details_state.dart';
import '../screens/profile/data_sources/profile_remote_ds.dart';
import '../screens/profile/profile_controller.dart';
import '../screens/profile/profile_repository.dart';
import '../screens/profile/profile_state.dart';
import '../screens/projects/data_sources/projects_remote_ds.dart';
import '../screens/projects/projects_controller.dart';
import '../screens/projects/projects_repository.dart';
import '../screens/projects/projects_state.dart';
import '../screens/search_screen/data_sources/search_remote_ds.dart';
import '../screens/search_screen/search_controller.dart';
import '../screens/search_screen/search_repository.dart';
import '../screens/search_screen/search_state.dart';
import '../screens/user_details/data_sources/user_details_remote_ds.dart';
import '../screens/user_details/user_details_controller.dart';
import '../screens/user_details/user_details_repository.dart';
import '../screens/user_details/user_details_state.dart';
import 'constants/route_names.dart';
import 'database/share_pref.dart';
import 'navigation/navigation_service.dart';
import 'navigation/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:artemis_utils/artemis_utils.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initNetworkManager();
  // initFullScreen();

  SharedPreferences sp = await SharedPreferences.getInstance();
  // ObjectBox objectBox = await ObjectBox.create();
  Connectivity connectivity = Connectivity();
  NetworkInfo networkInfo = NetworkInfo(connectivity);
  // MyDeviceInfo deviceInfo = await DeviceUtility.getInfo();
  //
  // ImageCatcher imageCatcher = ImageCatcher(sp);
  SharedPrefService sharedPrefService = SharedPrefService(sp);
  NavigationService navigationService = NavigationService();

  getIt.registerSingleton(navigationService);
  getIt.registerSingleton(sharedPrefService);
  // getIt.registerSingleton(deviceInfo);
  // getIt.registerSingleton(imageCatcher);

  ///login-------------------------------------------------------------------------------------------------------------------

  ///state
  LoginState loginState = LoginState();
  getIt.registerLazySingleton(() => loginState);

  ///data-sources
  LoginLocalDataSource loginLocalDataSource = LoginLocalDataSource(
    sharedPreferences: sp,
  );
  LoginRemoteDataSource loginRemoteDataSource = LoginRemoteDataSource(loginLocalDataSource);

  ///repository
  LoginRepository loginRepository = LoginRepository(
    loginRemoteDataSource: loginRemoteDataSource,
    loginLocalDataSource: loginLocalDataSource,
    networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => loginRepository);

  ///controller
  LoginController loginController = LoginController();
  getIt.registerLazySingleton(() => loginController);
  navigationService.registerController(RouteNames.login, loginController);

  MyRouter.initialize();

  ///Home-------------------------------------------------------------------------------------------------------------------

  ///state
  HomeState homeState = HomeState();
  getIt.registerLazySingleton(() => homeState);

  ///data-sources
  // HomeLocalDataSource homeLocalDataSource = HomeLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();

  ///repository
  HomeRepository homeRepository = HomeRepository(
    homeRemoteDataSource: homeRemoteDataSource,
    // homeLocalDataSource: homeLocalDataSource,
    // networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => homeRepository);

  ///controller
  HomeController homeController = HomeController();
  getIt.registerLazySingleton(() => homeController);
  navigationService.registerController(RouteNames.home, homeController);

  ///Search-------------------------------------------------------------------------------------------------------------------

  ///state
  SearchState searchState = SearchState();
  getIt.registerLazySingleton(() => searchState);

  ///data-sources
  // SearchLocalDataSource searchLocalDataSource = SearchLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  SearchRemoteDataSource searchRemoteDataSource = SearchRemoteDataSource();

  ///repository
  SearchRepository searchRepository = SearchRepository(
    searchRemoteDataSource: searchRemoteDataSource,
    // searchLocalDataSource: searchLocalDataSource,
    // networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => searchRepository);

  ///controller
  SearchController searchController = SearchController();
  getIt.registerLazySingleton(() => searchController);
  navigationService.registerController(RouteNames.search, searchController);

  ///Projects-------------------------------------------------------------------------------------------------------------------

  ///state
  ProjectsState projectsState = ProjectsState();
  getIt.registerLazySingleton(() => projectsState);

  ///data-sources
  // ProjectsLocalDataSource projectsLocalDataSource = ProjectsLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  ProjectsRemoteDataSource projectsRemoteDataSource = ProjectsRemoteDataSource();

  ///repository
  ProjectsRepository projectsRepository = ProjectsRepository(
    projectsRemoteDataSource: projectsRemoteDataSource,
    // projectsLocalDataSource: projectsLocalDataSource,
    // networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => projectsRepository);

  ///controller
  ProjectsController projectsController = ProjectsController();
  getIt.registerLazySingleton(() => projectsController);
  navigationService.registerController(RouteNames.projects, projectsController);

  ///People-------------------------------------------------------------------------------------------------------------------

  ///state
  PeopleState peopleState = PeopleState();
  getIt.registerLazySingleton(() => peopleState);

  ///data-sources
  // PeopleLocalDataSource peopleLocalDataSource = PeopleLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  PeopleRemoteDataSource peopleRemoteDataSource = PeopleRemoteDataSource();

  ///repository
  PeopleRepository peopleRepository = PeopleRepository(
    peopleRemoteDataSource: peopleRemoteDataSource,
    // peopleLocalDataSource: peopleLocalDataSource,
    networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => peopleRepository);

  ///controller
  PeopleController peopleController = PeopleController();
  getIt.registerLazySingleton(() => peopleController);
  navigationService.registerController(RouteNames.people, peopleController);

  ///Profile-------------------------------------------------------------------------------------------------------------------

  ///state
  ProfileState profileState = ProfileState();
  getIt.registerLazySingleton(() => profileState);

  ///data-sources
  // ProfileLocalDataSource profileLocalDataSource = ProfileLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  ProfileRemoteDataSource profileRemoteDataSource = ProfileRemoteDataSource();

  ///repository
  ProfileRepository profileRepository = ProfileRepository(
    profileRemoteDataSource: profileRemoteDataSource,
    // profileLocalDataSource: profileLocalDataSource,
    networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => profileRepository);

  ///controller
  ProfileController profileController = ProfileController();
  getIt.registerLazySingleton(() => profileController);
  navigationService.registerController(RouteNames.profile, profileController);

  ///UserDetails-------------------------------------------------------------------------------------------------------------------

  ///state
  UserDetailsState userDetailsState = UserDetailsState();
  getIt.registerLazySingleton(() => userDetailsState);

  ///data-sources
  // UserDetailsLocalDataSource userDetailsLocalDataSource = UserDetailsLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  UserDetailsRemoteDataSource userDetailsRemoteDataSource = UserDetailsRemoteDataSource();

  ///repository
  UserDetailsRepository userDetailsRepository = UserDetailsRepository(
    userDetailsRemoteDataSource: userDetailsRemoteDataSource,
    // userDetailsLocalDataSource: userDetailsLocalDataSource,
    networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => userDetailsRepository);

  ///controller
  UserDetailsController userDetailsController = UserDetailsController();
  getIt.registerLazySingleton(() => userDetailsController);
  navigationService.registerController(RouteNames.userDetails, userDetailsController);

  ///CreatePost-------------------------------------------------------------------------------------------------------------------

  ///state
  CreatePostState createPostState = CreatePostState();
  getIt.registerLazySingleton(() => createPostState);

  ///data-sources
  // CreatePostLocalDataSource createPostLocalDataSource = CreatePostLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  CreatePostRemoteDataSource createPostRemoteDataSource = CreatePostRemoteDataSource();

  ///repository
  CreatePostRepository createPostRepository = CreatePostRepository(
    createPostRemoteDataSource: createPostRemoteDataSource,
    // createPostLocalDataSource: createPostLocalDataSource,
    // networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => createPostRepository);

  ///controller
  CreatePostController createPostController = CreatePostController();
  getIt.registerLazySingleton(() => createPostController);
  navigationService.registerController(RouteNames.createPost, createPostController);

  ///PostDetails-------------------------------------------------------------------------------------------------------------------

  ///state
  PostDetailsState postDetailsState = PostDetailsState();
  getIt.registerLazySingleton(() => postDetailsState);

  ///data-sources
  // PostDetailsLocalDataSource postDetailsLocalDataSource = PostDetailsLocalDataSource(sharedPreferences: sp, objectBox: objectBox);
  PostDetailsRemoteDataSource postDetailsRemoteDataSource = PostDetailsRemoteDataSource();

  ///repository
  PostDetailsRepository postDetailsRepository = PostDetailsRepository(
    postDetailsRemoteDataSource: postDetailsRemoteDataSource,
    // postDetailsLocalDataSource: postDetailsLocalDataSource,
    // networkInfo: networkInfo,
  );
  getIt.registerLazySingleton(() => postDetailsRepository);

  ///controller
  PostDetailsController postDetailsController = PostDetailsController();
  getIt.registerLazySingleton(() => postDetailsController);
  navigationService.registerController(RouteNames.postDetails, postDetailsController);
}

initNetworkManager() {
  NetworkOption.initialize(
    timeout: 60000,
    headers: {
      'Content-Type': 'application/json',
    },
    extraSuccessRule: (NetworkResponse nr) {
      // if (nr.responseCode == 200 || nr.responseCode == 201) return true;
      // int statusCode = int.tryParse((nr.responseBody["Status"]?.toString() ?? nr.responseBody["ResultCode"]?.toString() ?? "0")) ?? 0;
      return nr.responseStatus;
    },
    successMsgExtractor: (data) {
      return (data["Message"] ?? data["ResultText"] ?? "Done").toString();
    },
    errorMsgExtractor: (data) {
      return (data["Message"] ?? data["ResultText"] ?? "Unknown Error").toString();
    },
    tokenExpireRule: (NetworkResponse res) {
      return res.extractedMessage?.contains("Token Expired") ?? false;
    },
    //   onTokenExpire: (NetworkResponse res) {
    // HomeController homeController = getIt<HomeController>();
    // homeController.logout();
    // }
  );
}
