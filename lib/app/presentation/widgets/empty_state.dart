import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/assets.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            AppAssets.emptyStateImage,
          ),
          const SizedBox(height: SpaceUtils.medium),
          Text(
            AppStrings.noItemsToDisplay,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: SpaceUtils.large),
        ],
      ),
    );
  }
}
