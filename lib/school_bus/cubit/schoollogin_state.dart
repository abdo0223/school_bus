abstract class SchoolLoginState {}

class SchoolLoginIntialState extends SchoolLoginState {}

class SchoolLoginLoadingState extends SchoolLoginState {}

class SchoolLoginSuccessState extends SchoolLoginState {
  final String uId;

  SchoolLoginSuccessState(this.uId);
}

class SchoolLoginERRORState extends SchoolLoginState {
  final String error;
  SchoolLoginERRORState(this.error);
}

class SchoolChangePasswordVisibiltyState extends SchoolLoginState {}
