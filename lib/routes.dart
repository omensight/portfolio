import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:portfolio/screens/project_list_screen/project_list_screen.dart';
import 'package:portfolio/screens/projects_screen/projects_screen.dart';
part 'routes.g.dart';

final goRouter = GoRouter(routes: $appRoutes);

@TypedGoRoute<IntroductionRoute>(path: '/', routes: [
  TypedGoRoute<ProjectListRoute>(
    path: 'projects',
    routes: [
      TypedGoRoute<ProjectDetailRoute>(path: ':id'),
    ],
  )
])
@immutable
class IntroductionRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@immutable
class ProjectDetailRoute extends GoRouteData {
  final int id;
  const ProjectDetailRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProjectsScreen(selectedProjectIndex: id);
  }
}

@immutable
class ProjectListRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProjectListScreen();
  }
}
