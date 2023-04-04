import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/notes_view_mode.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';
import 'package:note_it/app/presentation/widgets/custom_app_bar.dart';
import 'package:note_it/app/presentation/widgets/empty_state.dart';
import 'package:note_it/app/presentation/widgets/note_preview.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesViewModel>(
      converter: (Store<AppState> store) => NotesViewModel.fromStore(store),
      builder: (BuildContext context, NotesViewModel vm) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              const CustomAppBar(),
              SliverVisibility(
                visible: vm.allNotes.isEmpty,
                sliver: const SliverFillRemaining(
                  child: Center(
                    child: AppEmptyState(),
                  ),
                ),
              ),
              SliverVisibility(
                visible: vm.allNotes.isNotEmpty,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: List<Widget>.generate(
                      vm.allNotes.length,
                      (int index) {
                        final NoteEntity noteEntity = vm.allNotes[index];
                        return NotePreview(noteEntity: noteEntity);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.superLightGreenColor,
            child: const Icon(
              Icons.add,
              color: AppColors.darkGrayColor,
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.noteEditorRoute);
            },
          ),
        );
      },
    );
  }
}
