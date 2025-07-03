class SignInDto {
  final String email;
  final String password;

  SignInDto(this.email, this.password);

  Object toObject() {
    return {"email": email, "password": password};
  }
}
