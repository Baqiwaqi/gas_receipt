class LoginModel {
  LoginModel({
    this.email,
    this.password,
  });

  String? email = "";
  String? password = "";
}

class RegisterModel {
  RegisterModel({
    this.email,
    this.password,
  });

  String? email = "";
  String? password = "";
  String? passwordRepeat = "";
}
