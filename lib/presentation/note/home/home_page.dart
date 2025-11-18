import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wolvnote_flutter/common/constants.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/checklist_page.dart';
import 'package:wolvnote_flutter/presentation/note/draw/draw_page.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/custom_floating_button.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/note_list.dart';
import 'package:wolvnote_flutter/presentation/note/home/component/weather_widget.dart';
import 'package:wolvnote_flutter/presentation/note/notes/note_page.dart';
import 'package:wolvnote_flutter/presentation/note/salary/salary_page.dart';
import '../../../domain/model/pass_data.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final vm = ref.read(homeViewModelProvider.notifier);
      await vm.getNotes();
    });
    Future.microtask(() async {
      final vm = ref.read(homeViewModelProvider.notifier);
      await vm.determineWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final vm = ref.read(homeViewModelProvider.notifier);

    void refresh() async {
      await vm.getNotes();
    }

    void delete(int id) async {
      await vm.deleteNote(id);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            WeatherWidget(currentWeather: state.currentWeather),
            NoteList(
              isLoading: state.isLoading,
              parseContentData: vm.parseContentData,
              notes: state.notes,
              onDelete: (int value) {
                delete(value);
              },
              onOpen: (PassData value) async {
                switch (value.category) {
                  case Constants.CATEGORY_NOTE:
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NotePage(noteId: value.id),
                        ),
                      );
                      break;
                  case Constants.CATEGORY_DRAW:
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DrawPage(noteId: value.id),
                      ),
                    );
                    break;
                  case Constants.CATEGORY_SALARY:
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SalaryPage(noteId: value.id),
                      ),
                    );
                    break;
                  case Constants.CATEGORY_CHECKLIST:
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckListPage(noteId: value.id),
                      ),
                    );
                    break;
                }
                refresh();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        isToggle: state.isToggle,
        onClick: (value) async {
          switch(value){
            case Constants.CATEGORY_NOTE:
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotePage()),
              );
              break;
            case Constants.CATEGORY_DRAW:
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DrawPage()),
              );
              break;
            case Constants.CATEGORY_SALARY:
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SalaryPage()),
              );
              break;
            case Constants.CATEGORY_CHECKLIST:
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CheckListPage()),
              );
              break;
          }
          vm.setToggle(false);
          refresh();
        },
        onToggle: () {
          vm.setToggle(!state.isToggle);
        },
      ),
    );
  }
}
