import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/People/people_controller.dart';
import 'package:negarestan/screens/People/people_state.dart';
import 'package:negarestan/screens/home/home_state.dart';
import 'package:negarestan/screens/user_details/user_details_controller.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class PeopleView extends StatelessWidget {
  PeopleView({Key? key}) : super(key: key);
  final PeopleController peopleController = getIt<PeopleController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PeopleState peopleState = context.watch<PeopleState>();
    HomeState homeState = context.watch<HomeState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //
      // ),
      body: SizedBox(
        height: height,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            homeState.user!.followings!.length == 0
                ? const Center(child: Text('No Following', textAlign: TextAlign.center, style: MyTextTheme.white20))
                : Center(
                    child: Wrap(
                        children: homeState.user!.followings!
                            .map((following) => Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  height: 300,
                                  width: 350,
                                  // color: MyColors.blueAccent,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // color: MyColors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: MyColors.transparent,
                                        blurRadius: 1,
                                        offset: Offset(0, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Stack(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 350,
                                          height: 285,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                              child: Image(
                                                image: AssetImage(AssetImages.loginBG3),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 150),
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: MyColors.customGrey,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(top: 10),
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: const [
                                                    Icon(Icons.email, color: MyColors.darkBlue, size: 25),
                                                    Icon(Icons.add, color: MyColors.green, size: 28),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  final UserDetailsController userDetailsController = getIt<UserDetailsController>();
                                                  userDetailsController.getUserDetails(userID: following.id.toString());
                                                },
                                                child: Text(following.username!, textAlign: TextAlign.center, style: MyTextTheme.whiteW50022),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text('Graphic design', textAlign: TextAlign.center, style: MyTextTheme.whiteW40015),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        '10 k',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: MyColors.white),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Icon(Icons.person, color: MyColors.white, size: 20),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        '10 k',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: MyColors.white),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Icon(Icons.remove_red_eye, color: MyColors.blueAccent, size: 20)
                                                    ],
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        '10 k',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: MyColors.white),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Icon(Icons.favorite, color: MyColors.red, size: 20),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Center(
                                          child: CircleAvatar(
                                            radius: 50.0, // adjust the radius as needed
                                            backgroundImage: AssetImage(AssetImages.admin_image), // or use AssetImage for local images
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()),
                  )
          ],
        ),
      ),
    );
  }
}
