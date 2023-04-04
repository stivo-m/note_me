import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editor_plus/markdown_editor_plus.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/notes_view_mode.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:markdown_editor_plus/src/toolbar.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesViewModel>(
      converter: (Store<AppState> store) => NotesViewModel.fromStore(store),
      onInit: (Store<AppState> store) {
        final NoteEntity? activeNote = store.state.noteState?.activeNote;
        titleController = TextEditingController(
          text: activeNote?.title ?? AppStrings.defaultTitle,
        );
        bodyController = TextEditingController(text: activeNote?.body);
      },
      builder: (BuildContext context, NotesViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              key: WidgetKeys.backButtonKey,
              onPressed: () {
                if (bodyController.text.isEmpty) {
                  return;
                }

                /// We need to handle autosave at this point. This is because
                /// the user may not have saved this note by the time they are
                /// exiting the screen
                if (vm.activeNote == null) {
                  // Create a new note
                  vm.addNote(
                    title: titleController.text,
                    body: bodyController.text,
                  );
                } else {
                  // update existing note
                  vm.updateNote(
                    id: vm.activeNote?.id,
                    title: titleController.text,
                    body: bodyController.text,
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
                      title: titleController.text,
                      body: bodyController.text,
                    );
                  } else {
                    // update existing note
                    vm.updateNote(
                      id: vm.activeNote?.id,
                      title: titleController.text,
                      body: bodyController.text,
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
              MarkdownField(
                key: WidgetKeys.markdownTitleKey,
                controller: titleController,
                emojiConvert: true,
                maxLines: 1,
                expands: false,
                padding: const EdgeInsets.symmetric(
                  horizontal: SpaceUtils.large,
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                decoration: const InputDecoration.collapsed(
                  hintText: AppStrings.defaultTitle,
                ),
              ),
              const SizedBox(height: SpaceUtils.veryLarge),
              Expanded(
                child: MarkdownField(
                  key: WidgetKeys.markdownBodyKey,
                  controller: bodyController,
                  emojiConvert: true,
                  expands: false,
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpaceUtils.large,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                  decoration: InputDecoration.collapsed(
                    hintText: AppStrings.startTypingText,
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.5),
                        ),
                  ),
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
                child: MarkdownToolbar(
                  key: WidgetKeys.markdownToolbarKey,
                  controller: bodyController,
                  toolbar: Toolbar(controller: bodyController),
                  toolbarBackground: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
