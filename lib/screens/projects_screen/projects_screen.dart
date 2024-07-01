import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/generated/codegen_loader.g.dart';
import 'package:url_launcher/url_launcher.dart';

const List<ProjectData> projects = [
  ProjectData(
    projectName: 'No Click',
    projectDescription: LocaleKeys.noClickProjectDescription,
    imageFiles: [
      'assets/screenshots/no_click_ss_00.png',
      'assets/screenshots/no_click_ss_01.png',
      'assets/screenshots/no_click_ss_02.png',
    ],
    url: 'https://github.com/omensight/no_click_releases',
  ),
  ProjectData(
    projectName: 'Etech',
    projectDescription: LocaleKeys.etechProjectDescription,
    imageFiles: [
      'assets/screenshots/etech_00.png',
      'assets/screenshots/etech_01.png',
      'assets/screenshots/etech_02.png',
      'assets/screenshots/etech_03.png',
      'assets/screenshots/etech_04.png',
      'assets/screenshots/etech_05.png',
      'assets/screenshots/etech_06.png',
      'assets/screenshots/etech_07.png',
      'assets/screenshots/etech_08.png',
      'assets/screenshots/etech_09.png',
      'assets/screenshots/etech_10.png',
      'assets/screenshots/etech_11.png',
      'assets/screenshots/etech_12.png',
    ],
    url: '',
  ),
];

class ProjectsScreen extends StatefulWidget {
  final int selectedProjectIndex;
  const ProjectsScreen({
    super.key,
    required this.selectedProjectIndex,
  });

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int _selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(body: Builder(
        builder: (context) {
          final project = projects[widget.selectedProjectIndex];
          final imageFiles = project.imageFiles;
          const double spacing = 8;
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project.projectName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Visibility(
                      visible: project.url.isNotEmpty,
                      child: IconButton(
                        onPressed: () {
                          final url = Uri.parse(project.url);
                          launchUrl(url);
                        },
                        icon: SvgPicture.asset(
                            'assets/vectors/github-mark-white.svg'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: spacing),
                Text(
                  project.projectDescription.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: spacing),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                              project.imageFiles[_selectedImageIndex])),
                      const SizedBox(width: spacing),
                      LayoutBuilder(builder: (context, constraints) {
                        return SizedBox(
                            width: 180,
                            height: constraints.maxHeight,
                            child: ListView(
                              shrinkWrap: true,
                              children: imageFiles
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Image.asset(
                                                e,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _selectedImageIndex =
                                                  imageFiles.indexOf(e);
                                            });
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

class ProjectData {
  final String projectName;
  final String projectDescription;
  final List<String> imageFiles;
  final String url;
  const ProjectData({
    required this.projectName,
    required this.projectDescription,
    required this.imageFiles,
    required this.url,
  });
}
