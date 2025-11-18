import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/data/database/app_database.dart';
import 'package:wolvnote_flutter/data/remote/api_client.dart';
import 'package:wolvnote_flutter/data/remote/weather_remote_data_sourceimpl.dart';
import 'package:wolvnote_flutter/data/repository/location_repositoryimpl.dart';
import 'package:wolvnote_flutter/data/repository/note_repositoryimpl.dart';
import 'package:wolvnote_flutter/data/repository/password_repositoryimpl.dart';
import 'package:wolvnote_flutter/data/repository/weather_repositoryimpl.dart';
import 'package:wolvnote_flutter/domain/usecase/location/location_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/note/delete_note_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/note/get_note_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/note/get_notes_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/note/insert_note_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/note/update_note_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/password/get_password_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/password/insert_password_usecase.dart';
import 'package:wolvnote_flutter/domain/usecase/weather/weather_usecase.dart';
import 'package:wolvnote_flutter/presentation/auth/login_state.dart';
import 'package:wolvnote_flutter/presentation/auth/login_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/auth/signup_state.dart';
import 'package:wolvnote_flutter/presentation/auth/signup_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/checklist_state.dart';
import 'package:wolvnote_flutter/presentation/note/checklist/checklist_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/note/draw/draw_state.dart';
import 'package:wolvnote_flutter/presentation/note/draw/draw_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/note/home/home_state.dart';
import 'package:wolvnote_flutter/presentation/note/home/home_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/note/notes/note_state.dart';
import 'package:wolvnote_flutter/presentation/note/notes/note_viewmodel.dart';
import 'package:wolvnote_flutter/presentation/note/salary/salary_state.dart';
import 'package:wolvnote_flutter/presentation/note/salary/salary_viewmodel.dart';

//Database
final databaseProvider = Provider((ref) => AppDatabase());
final passwordDaoProvider = Provider(
  (ref) => ref.watch(databaseProvider).passwordDao,
);
final noteDaoProvider = Provider((ref) => ref.watch(databaseProvider).noteDao);

//API
final apiClientProvider = Provider((ref) => ApiClient());
final weatherRemoteDatasourceProvider = Provider(
  (ref) => WeatherRemoteDataSourceImpl(ref.watch(apiClientProvider)),
);

//Repositories
final passwordRepositoryProvider = Provider(
  (ref) => PasswordRepositoryImpl(ref.watch(passwordDaoProvider)),
);
final noteRepositoryProvider = Provider(
  (ref) => NoteRepositoryImpl(ref.watch(noteDaoProvider)),
);
final weatherRepositoryProvider = Provider(
  (ref) => WeatherRepositoryImpl(ref.watch(weatherRemoteDatasourceProvider)),
);
final locationRepositoryProvider = Provider(
    (ref) => LocationRepositoryImpl(),
);

//UseCases
final getPasswordUseCaseProvider = Provider(
  (ref) => GetPasswordUseCase(ref.watch(passwordRepositoryProvider)),
);
final insertPasswordUseCaseProvider = Provider(
  (ref) => InsertPasswordUseCase(ref.watch(passwordRepositoryProvider)),
);
final deleteNoteUseCaseProvider = Provider(
  (ref) => DeleteNoteUseCase(ref.watch(noteRepositoryProvider)),
);
final getNoteUseCaseProvider = Provider(
  (ref) => GetNoteUseCase(ref.watch(noteRepositoryProvider)),
);
final getNotesUseCaseProvider = Provider(
  (ref) => GetNotesUseCase(ref.watch(noteRepositoryProvider)),
);
final insertNoteUseCaseProvider = Provider(
  (ref) => InsertNoteUseCase(ref.watch(noteRepositoryProvider)),
);
final updateNoteUseCaseProvider = Provider(
  (ref) => UpdateNoteUseCase(ref.watch(noteRepositoryProvider)),
);
final weatherUseCaseProvider = Provider(
  (ref) => WeatherUseCase(ref.watch(weatherRepositoryProvider)),
);
final locationUseCaseProvider = Provider(
    (ref) => LocationUseCase(ref.watch(locationRepositoryProvider)),
);

//ViewModels
final loginViewModelProvider = NotifierProvider<LoginViewModel, LoginState>(
  () => LoginViewModel(),
);
final signUpViewModelProvider = NotifierProvider<SignUpViewModel, SignUpState>(
  () => SignUpViewModel(),
);
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
    () => HomeViewModel(),
);
final noteViewModelProvider = NotifierProvider<NoteViewModel, NoteState>(
      () => NoteViewModel(),
);
final checklistViewModelProvider = NotifierProvider<CheckListViewModel, CheckListState>(
      () => CheckListViewModel(),
);
final salaryViewModelProvider = NotifierProvider<SalaryViewModel, SalaryState>(
      () => SalaryViewModel(),
);
final drawViewModelProvider = NotifierProvider<DrawViewModel, DrawState>(
      () => DrawViewModel(),
);