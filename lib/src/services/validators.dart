import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }
  if (!email.isEmail) return 'Digite um email válido!';
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha!';
  }
  if (password.length < 7) {
    return 'Digite uma senha maior do que 7 caracteres!';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu nome completo!';
  }

  final names = name.split(' ');
  if (names.length == 1) {
    return 'Digite o seu nome e o sobrenome!';
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um celular!';
  }
  if (!phone.isPhoneNumber) {
    return 'Digite um número válido';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF!';
  }
  if (!cpf.isCpf) {
    return 'Digite um CPF válido';
  }

  return null;
}
