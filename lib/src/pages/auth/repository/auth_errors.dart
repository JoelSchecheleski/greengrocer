
String authErrorsString(String? code) {
  switch(code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválido';
    default:
      return 'Um erro indefinido ocorreu';
  }

}