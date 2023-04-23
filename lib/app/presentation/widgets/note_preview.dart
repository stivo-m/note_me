import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quil;
import 'package:note_it/app/application/states/actions/notes/set_active_note_action.dart';
import 'package:note_it/app/application/utils/text_utils.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class NotePreview extends StatefulWidget {
  const NotePreview({
    required this.noteEntity,
    super.key,
  });

  final NoteEntity noteEntity;

  @override
  State<NotePreview> createState() => _NotePreviewState();
}

class _NotePreviewState extends State<NotePreview> {
  late quil.QuillController titleController;
  late quil.QuillController bodyController;
  FocusNode titleFocusNode = FocusNode();
  FocusNode bodyFocusNode = FocusNode();

  @override
  void initState() {
    final dynamic title = jsonDecode(widget.noteEntity.title ?? '[]');
    final dynamic body = jsonDecode(widget.noteEntity.body ?? '[]');
    titleController = quil.QuillController(
      selection: const TextSelection.collapsed(offset: 0),
      document: quil.Document.fromJson(
        title,
      ),
    );
    bodyController = quil.QuillController(
      selection: const TextSelection.collapsed(offset: 0),
      document: quil.Document.fromJson(
        body,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        StoreProvider.dispatch(
          context,
          SetActiveNoteAction(id: widget.noteEntity.id),
        );
        Navigator.of(context).pushNamed(AppRoutes.noteEditorRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(SpaceUtils.large),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.primaryGreenColor.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Title snippet
                  quil.QuillEditor(
                    enableInteractiveSelection: false,
                    focusNode: titleFocusNode,
                    autoFocus: false,
                    expands: false,
                    scrollController: ScrollController(),
                    scrollable: true,
                    padding: const EdgeInsets.all(0),
                    controller: titleController,
                    readOnly: true,
                    maxHeight: 50,
                    customStyles: quil.DefaultStyles(
                      paragraph: quil.DefaultTextBlockStyle(
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 16,
                            ),
                        const quil.VerticalSpacing(0, 0),
                        const quil.VerticalSpacing(0, 0),
                        null,
                      ),
                    ),
                  ),
                  const SizedBox(height: SpaceUtils.large),
                  // Body snippet
                  quil.QuillEditor(
                    enableInteractiveSelection: false,
                    focusNode: bodyFocusNode,
                    autoFocus: false,
                    expands: false,
                    scrollController: ScrollController(),
                    scrollable: true,
                    padding: const EdgeInsets.all(0),
                    controller: bodyController,
                    readOnly: true,
                    maxHeight: 100,
                    customStyles: quil.DefaultStyles(
                      paragraph: quil.DefaultTextBlockStyle(
                        Theme.of(context).textTheme.bodySmall!,
                        const quil.VerticalSpacing(4, 10),
                        const quil.VerticalSpacing(0, 0),
                        null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SpaceUtils.large),
            // Timestamps
            Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.clock,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  size: 14,
                ),
                const SizedBox(width: SpaceUtils.small),
                AutoSizeText(
                  TextUtils.formatTimeAgo(widget.noteEntity.createdAt),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
