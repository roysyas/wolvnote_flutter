class SignUpState {
  final bool isSaving;
  const SignUpState({this.isSaving = false});

  SignUpState copyWith({bool? isSaving}) => SignUpState(
    isSaving: isSaving ?? this.isSaving,
  );
}