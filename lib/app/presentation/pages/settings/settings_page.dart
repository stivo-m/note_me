import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/theme_view_model.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/domain/constants/strings.dart';
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
          body: ListView(
            children: <Widget>[
              SwitchListTile(
                key: WidgetKeys.settingsBtnKey,
                activeColor: AppColors.primaryGreenColor,
                title: Text(
                  AppStrings.switchToTheme(
                    vm.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: vm.themeMode == ThemeMode.dark,
                onChanged: (bool? value) {
                  vm.updateTheme(
                    value == true ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
