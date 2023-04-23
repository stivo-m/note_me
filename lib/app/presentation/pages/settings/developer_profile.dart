import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_it/app/application/utils/helpers.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';

class DeveloperProfilePage extends StatelessWidget {
  const DeveloperProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          AppStrings.aboutDeveloperText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: SpaceUtils.veryLarge),
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  AppStrings.profileImageUrl,
                ),
              ),
              const SizedBox(height: SpaceUtils.veryLarge),
              const SizedBox(height: SpaceUtils.veryLarge),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: SpaceUtils.large),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: AppStrings.developerName,
                        children: <TextSpan>[
                          TextSpan(
                            text: AppStrings.developerDesignation,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20,
                                ),
                          )
                        ],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                      ),
                    ),
                    const SizedBox(height: SpaceUtils.veryLarge),
                    AutoSizeText(
                      AppStrings.aboutDeveloper,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SpaceUtils.veryLarge),
              const SizedBox(height: SpaceUtils.veryLarge),
              ListTile(
                onTap: () {
                  launchTargetUrls(AppStrings.whatssappLink);
                },
                leading: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                ),
                title: Text(
                  AppStrings.whatssappText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: Text(
                  AppStrings.whatssappDescText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              ListTile(
                onTap: () {
                  launchTargetUrls(AppStrings.linkedinLink);
                },
                leading: const FaIcon(
                  FontAwesomeIcons.linkedin,
                ),
                title: Text(
                  AppStrings.linkedinText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: Text(
                  AppStrings.linkedinDescText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              ListTile(
                onTap: () {
                  launchTargetUrls(AppStrings.twitterinLink);
                },
                leading: const FaIcon(
                  FontAwesomeIcons.twitter,
                ),
                title: Text(
                  AppStrings.twitterinText,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: Text(
                  AppStrings.twitterinDescText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
