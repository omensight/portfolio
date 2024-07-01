import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/generated/codegen_loader.g.dart';
import 'package:portfolio/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mijael Viricochea',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                  onPressed: () {
                    ProjectListRoute().push(context);
                  },
                  child: Text(LocaleKeys.seeAllProjects.tr()))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.helloEveryone.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 512),
                child: Text(
                  LocaleKeys.personalIntroduction.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                splashRadius: 24,
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/vectors/linkedIn_logo.svg',
                  width: 18,
                ),
                splashRadius: 24,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
