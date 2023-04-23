import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/theme_view_model.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeViewModel>(
      converter: (Store<AppState> store) => ThemeViewModel.fromStore(store),
      builder: (BuildContext context, ThemeViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              AppStrings.settingsTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SwitchListTile(
                        key: WidgetKeys.settingsBtnKey,
                        activeColor: AppColors.primaryGreenColor,
                        title: Text(
                          AppStrings.changeThemeText,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          AppStrings.switchToTheme(
                            vm.themeMode == ThemeMode.dark
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          ),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        value: vm.themeMode == ThemeMode.dark,
                        onChanged: (bool? value) {
                          vm.updateTheme(
                            value == true ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      ),
                      const SizedBox(height: SpaceUtils.large),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.developerProfileRoute,
                          );
                        },
                        title: Text(
                          AppStrings.aboutDeveloperText,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          AppStrings.aboutDeveloperDesc,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      )
                    ],
                  ),
                ),

                // version
                Text(
                  AppStrings.appVersionText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: SpaceUtils.large),
              ],
            ),
          ),
        );
      },
    );
  }
}
