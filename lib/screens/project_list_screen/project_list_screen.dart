import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/generated/codegen_loader.g.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/screens/projects_screen/projects_screen.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.projects.tr(),
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GridView.count(
                childAspectRatio: 16 / 9,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                children: projects
                    .map((e) => Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              LayoutBuilder(
                                builder: (context, constraints) => Image.asset(
                                  e.imageFiles[0],
                                  height: constraints.maxHeight,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(.33),
                              ),
                              Center(child: Text(e.projectName)),
                              InkWell(
                                onTap: () {
                                  ProjectDetailRoute(id: projects.indexOf(e))
                                      .push(context);
                                },
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPress() {}
}
