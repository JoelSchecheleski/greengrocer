import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(197, 253, 191, 1.0),
      //Color.fromRGBO(210, 210, 167, 1.0),

      body: Column(
        children: [
          Expanded(
              child: Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(197, 253, 191, 1.0),
              image: DecorationImage(
                  image: AssetImage("assets/images/grocery_with_text.png"),
                  fit: BoxFit.cover),
            ),
          )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                const CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),

                // Senha
                const CustomTextField(
                  icon: Icons.lock,
                  label: 'Password',
                  isSecret: true,
                ),

                // Entrar
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Entrar',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
