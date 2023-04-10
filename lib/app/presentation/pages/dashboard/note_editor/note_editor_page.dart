import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quil;
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/notes_view_mode.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  FocusNode titleFocusNode = FocusNode();
  late quil.QuillController titleController;
  FocusNode bodyFocusNode = FocusNode();
  late quil.QuillController bodyController;
  ScrollController titleScrollController = ScrollController();
  ScrollController bodyScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesViewModel>(
      converter: (Store<AppState> store) => NotesViewModel.fromStore(store),
      onInit: (Store<AppState> store) {
        final NoteEntity? activeNote = store.state.noteState?.activeNote;
        final dynamic title = jsonDecode(activeNote?.title ?? '[]');
        final dynamic body = jsonDecode(activeNote?.body ?? '[]');
        titleController =
            activeNote?.title == null || activeNote!.title!.isEmpty
                ? quil.QuillController.basic()
                : quil.QuillController(
                    selection: const TextSelection.collapsed(offset: 0),
                    document: quil.Document.fromJson(
                      title,
                    ),
                  );
        bodyController = activeNote?.body == null || activeNote!.body!.isEmpty
            ? quil.QuillController.basic()
            : quil.QuillController(
                selection: const TextSelection.collapsed(offset: 0),
                document: quil.Document.fromJson(
                  body,
                ),
              );
      },
      builder: (BuildContext context, NotesViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              key: WidgetKeys.backButtonKey,
              onPressed: () {
                final String title = jsonEncode(
                  titleController.document.toDelta().toJson(),
                );
                final String body = jsonEncode(
                  bodyController.document.toDelta().toJson(),
                );

                if (body.isEmpty) {
                  return;
                }

                /// We need to handle autosave at this point. This is because
                /// the user may not have saved this note by the time they are
                /// exiting the screen
                if (vm.activeNote == null) {
                  // Create a new note
                  vm.addNote(
                    title: title,
                    body: body,
                  );
                } else {
                  // update existing note
                  vm.updateNote(
                    id: vm.activeNote?.id,
                    title: title,
                    body: body,
                  );
                }

                /// irregardless of the above outcomes, we want to reset the
                /// active note as we exit this screen
                vm.resetActiveNote();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              AppStrings.createNoteText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: <Widget>[
              TextButton(
                key: WidgetKeys.saveButtonKey,
                onPressed: () {
                  if (vm.activeNote == null) {
                    // Create a new note
                    vm.addNote(
                      title: jsonEncode(
                        titleController.document.toDelta().toJson(),
                      ),
                      body: jsonEncode(
                        bodyController.document.toDelta().toJson(),
                      ),
                    );
                  } else {
                    // update existing note
                    vm.updateNote(
                      id: vm.activeNote?.id,
                      title: jsonEncode(
                        titleController.document.toDelta().toJson(),
                      ),
                      body: jsonEncode(
                        bodyController.document.toDelta().toJson(),
                      ),
                    );
                  }
                },
                child: const Text(AppStrings.saveText),
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              const SizedBox(height: SpaceUtils.large),
              // Note TItle
              quil.QuillEditor(
                key: WidgetKeys.markdownTitleKey,
                focusNode: titleFocusNode,
                autoFocus: false,
                expands: false,
                scrollController: titleScrollController,
                scrollable: false,
                padding: const EdgeInsets.symmetric(
                  horizontal: SpaceUtils.medium,
                ),
                placeholder: AppStrings.defaultTitle,
                controller: titleController,
                readOnly: false,
                customStyles: quil.DefaultStyles(
                  paragraph: quil.DefaultTextBlockStyle(
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 24,
                        ),
                    const quil.VerticalSpacing(0, 0),
                    const quil.VerticalSpacing(0, 0),
                    null,
                  ),
                  placeHolder: quil.DefaultTextBlockStyle(
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 24,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                    const quil.VerticalSpacing(0, 0),
                    const quil.VerticalSpacing(0, 0),
                    null,
                  ),
                ),
              ),
              const SizedBox(height: SpaceUtils.veryLarge),
              // Note body
              Expanded(
                key: WidgetKeys.markdownBodyKey,
                child: quil.QuillEditor(
                  focusNode: bodyFocusNode,
                  autoFocus: true,
                  expands: true,
                  scrollController: bodyScrollController,
                  scrollable: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpaceUtils.medium,
                  ),
                  controller: bodyController,
                  placeholder: AppStrings.defaultBodyHintText,
                  readOnly: false,
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.15),
                    ),
                  ),
                ),
                child: quil.QuillToolbar.basic(
                  key: WidgetKeys.markdownToolbarKey,
                  controller: bodyController,
                  showAlignmentButtons: false,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
