import 'package:flutter/material.dart';
import 'package:login_flutter/widgets/default_input.dart';
import '../dados_mock.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
final TextEditingController emailController = TextEditingController();
final TextEditingController senhaController = TextEditingController();
  bool esconderSenha = true;
  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }
    void entrar() {
      String email = emailController.text.trim();
      String senha = senhaController.text;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.account_circle, size: 100),
            const Text(
              "Seja bem-vindo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Faça login para acessar o sistema",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            DefaultInput(
              controller: emailController,
              tipoTeclado: TextInputType.emailAddress,
              labelText: "E-mail",
              hintText: "Insira seu e-mail",
              esconderSenha: false,
              prefixIcon: Icon(Icons.email),
            ),
            DefaultInput(
              controller: senhaController,
              tipoTeclado: TextInputType.text,
              labelText: "Senha",
              hintText: "Insira sua senha",
              esconderSenha: esconderSenha,
              prefixIcon: Icon(Icons.password),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    esconderSenha = !esconderSenha;
                  });
                },
                icon: Icon(
                  esconderSenha ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            SizedBox(height: 25),

            ElevatedButton(onPressed: entrar, child: Text("Entrar")),
            TextButton(
              onPressed: () {},
              child: Text("Ainda não tem uma conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}