import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/spacers.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    this.title,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    super.key,
  });

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title != null) ...<Widget>[
          const SizedBox(height: SpaceUtils.medium),
          Text(title!),
        ],
        const SizedBox(height: SpaceUtils.small),
        TextFormField(
          enabled: enabled,
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: SpaceUtils.small,
              horizontal: SpaceUtils.large,
            ),
          ),
        ),
        const SizedBox(height: SpaceUtils.small),
      ],
    );
  }
}
