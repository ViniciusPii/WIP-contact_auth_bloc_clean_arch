import 'package:contact_auth_bloc/src/core/theme/app_styles.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/home/controller/home_state.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/home/home_page.dart';
import 'package:contact_auth_bloc/src/features/main/presentation/main/controller/main_cubit.dart';
import 'package:contact_auth_bloc/src/features/main/presentation/main/controller/main_state.dart';
import 'package:contact_auth_bloc/src/features/profile/presentation/profile/controller/profile_cubit.dart';
import 'package:contact_auth_bloc/src/features/profile/presentation/profile/controller/profile_state.dart';
import 'package:contact_auth_bloc/src/features/profile/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BaseBlocState<MainPage, MainCubit> {
  late HomeCubit homeController;
  late ProfileCubit profileController;

  @override
  void initState() {
    super.initState();
    homeController = getIt.get<HomeCubit>();
    profileController = getIt.get<ProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: controller,
      builder: (context, state) {
        return Scaffold(
          body: _getPages(index: state.currentPage),
          bottomNavigationBar: state.hideBottomNavigation
              ? null
              : BottomNavigationBar(
                  backgroundColor: AppStyles.background,
                  unselectedItemColor: AppStyles.textLightColor,
                  selectedItemColor: AppStyles.secondary,
                  currentIndex: state.currentPage,
                  onTap: (index) {
                    controller.changeBottomNavigator(
                      isHide: false,
                      pageIndex: index,
                    );
                  },
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'Perfil',
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _getPages({required int index}) {
    switch (index) {
      case 0:
        return BlocListener<HomeCubit, HomeState>(
          bloc: homeController,
          listener: (context, state) {
            controller.changeBottomNavigator(
              isHide: state is HomeStateLoading || state is HomeStateError,
              pageIndex: index,
            );
          },
          child: HomePage(controller: homeController),
        );
      case 1:
        return BlocListener<ProfileCubit, ProfileState>(
          bloc: profileController,
          listener: (context, state) {
            controller.changeBottomNavigator(
              isHide: state is ProfileStateUpdateUserLoading || state is ProfileStateUserError,
              pageIndex: index,
            );
          },
          child: ProfilePage(controller: profileController),
        );
      default:
        return BlocListener<HomeCubit, HomeState>(
          bloc: homeController,
          listener: (context, state) {
            controller.changeBottomNavigator(
              isHide: state is HomeStateLoading,
              pageIndex: index,
            );
          },
          child: HomePage(controller: homeController),
        );
    }
  }
}
