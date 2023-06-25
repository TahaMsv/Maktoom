import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/core/constants/ui.dart';
import 'package:negarestan/screens/projects/projects_controller.dart';
import 'package:negarestan/screens/projects/projects_state.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/constants/assets.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key}) : super(key: key);
  final ProjectsController projectsController = getIt<ProjectsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ProjectsState projectsState = context.watch<ProjectsState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SizedBox(
        height: height,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Wrap(
                children: List.generate(
                  10,
                  (index) => GestureDetector(
                    onTap: () {
                      projectsController.nav.pushNamed('postDetails');
                    },
                    child: Card(
                      color: MyColors.customGrey,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 350,
                        width: 350,
                        // color: MyColors.blueAccent,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: MyColors.lightGrey2,
                                ),
                                child: Image(
                                  image: AssetImage(AssetImages.loginBG7),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
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
                                  Text(
                                    'Project name $index',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: MyColors.white, fontSize: 17),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.favorite, color: MyColors.red, size: 20),
                                      SizedBox(width: 3),
                                      Text(
                                        '10 k',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: MyColors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
