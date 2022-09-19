import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 223, 228, 3.0),
      //Color.fromRGBO(210, 210, 167, 1.0),

      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(222, 223, 228, 3.0),
                image: DecorationImage(
                    image: AssetImage("assets/images/green_grocery_health.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),

          // AnimatedTextKit(
          //   animatedTexts: [
          //     FadeAnimatedText('Frutas'),
          //     FadeAnimatedText('Carnes'),
          //     FadeAnimatedText('Verduras'),
          //     FadeAnimatedText('Grãos')
          //   ],
          // ),

          // FORMULÁRIO
          Container(
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

                // Esqueceu a senha?
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
                ),

                // Divisor
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                ),

                // Botão novo usuário
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
