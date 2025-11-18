import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/presentation/note/salary/component/input_salary.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/input_title.dart';

class SalaryPage extends ConsumerStatefulWidget{
  final int? noteId;
  const SalaryPage({super.key, this.noteId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SalaryPageState();
}

class _SalaryPageState extends ConsumerState<SalaryPage>{

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (widget.noteId != null) {
        final vm = ref.read(salaryViewModelProvider.notifier);
        await vm.getNote(widget.noteId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(salaryViewModelProvider);
    final vm = ref.read(salaryViewModelProvider.notifier);
    final theme = Theme.of(context);
    final contentController = TextEditingController();
    if (state.notes != null) {
      contentController.text = state.notes!;
    }

    if (state.isSuccess) {
      Future.microtask((){
        vm.resetState();
        Navigator.pop(context);
      });
    }

    Widget inputTitle = Align(
      alignment: Alignment.bottomCenter,
      child: InputTitle(
        onClick: (value) {
          vm.titleUpdate(value);
        },
      ),
    );

    Widget inputSalary = Align(
      alignment: Alignment.bottomCenter,
      child: InputSalary(
        onClick: (String value) {
          vm.calculate(value);
        },
      ),
    );

    Widget main = Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            state.noteTitle ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        state.createDate != null
            ? Align(
          alignment: Alignment.centerRight,
          child: Text(
            state.createDate ?? "",
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.outlineVariant,
            ),
          ),
        )
            : SizedBox.shrink(),
        state.lastEditDate != null
            ? Align(
          alignment: Alignment.centerRight,
          child: Text(
            state.lastEditDate ?? "",
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.outlineVariant,
            ),
          ),
        )
            : SizedBox.shrink(),
        SizedBox(height: 8),
        Expanded(
          flex: 1,
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            controller: contentController,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Salary calculation result',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.0,
                ),
              ),
            ),
            keyboardType: TextInputType.multiline,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              vm.contentUpdate(contentController.text);
              vm.insertOrUpdate();
            },
            icon: Icon(Icons.save, color: theme.colorScheme.primary, size: 48.0,),
          ),
        ),
      ],
    );

    Widget content = state.notes == null ? inputSalary : main;

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(16),
            child: state.noteTitle == null ? inputTitle : content,
          )
      ),
    );
  }

}