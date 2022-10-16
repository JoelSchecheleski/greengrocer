
String authErrorsString(String? code) {
  switch(code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválido';
    case 'INVALID_TOKEN':
      return 'Sessão expirada, token inválido';
    default:
      return 'Um erro indefinido ocorreu';
  }

}