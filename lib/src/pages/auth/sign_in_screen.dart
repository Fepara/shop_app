import 'package:flutter/material.dart';
import 'package:shop_app/src/pages/auth/base/base_screen.dart';
import 'package:shop_app/src/pages/auth/sign_up_screen.dart';

import '../common_widget/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(157, 35, 218, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Size.height,
          width: Size.width,
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do app
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          TextSpan(
                            text: 'Rain',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: 'Store',
                              style: TextStyle(
                                color: Color.fromRGBO(71, 18, 142, 1),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
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
                      label: 'Senha',
                      isSecret: true,
                    ),

                    // Botão de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (c) {
                                return const BaseScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    // Esqueceu a senha
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha ?',
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
                            child: Text('ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão de novo usuário
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.purple,
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
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
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
