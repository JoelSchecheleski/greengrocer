import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/auth/sign_up_screen.dart';

import '../config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      // Color.fromRGBO(78, 136, 27, 1.0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      // height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.customSwatchColor,
                        //Color.fromRGBO(78, 136, 27, 1.0),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/green.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    //   child: DefaultTextStyle(
                    //     style: const TextStyle(
                    //       fontSize: 25,
                    //     ),
                    //     child: AnimatedTextKit(
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         FadeAnimatedText('Frutas'),
                    //         FadeAnimatedText('Carnes'),
                    //         FadeAnimatedText('Verduras'),
                    //         FadeAnimatedText('Grãos')
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  child: AnimatedTextKit(
                    pause: Duration.zero,
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText('Frutas'),
                      FadeAnimatedText('Carnes'),
                      FadeAnimatedText('Verduras'),
                      FadeAnimatedText('Grãos')
                    ],
                  ),
                ),
              ),

              // FORMULÁRIO
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
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
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    // Esqueceu a senha?
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color:
                                CustomColors.customContrastColor, // Colors.red,
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return const SignUpScreen();
                            }),
                          );
                        },
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
        ),
      ),
    );
  }
}
