import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/app/presentation/widgets/app_input_field.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      automaticallyImplyLeading: false,
      collapsedHeight: kToolbarHeight,
      expandedHeight: max(MediaQuery.of(context).size.height * 0.10, 140),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(
            horizontal: SpaceUtils.large,
            vertical: SpaceUtils.large,
          ),
          child: const AppInputField(
            hintText: AppStrings.searchHintText,
            enabled: false,
          ),
        ),
      ),
      title: Text(
        AppStrings.notesTitle,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: <Widget>[
        IconButton(
          key: WidgetKeys.settingsBtnKey,
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.settingsRoute);
          },
        ),
      ],
    );
  }
}
