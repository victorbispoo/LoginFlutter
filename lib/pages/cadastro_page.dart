import 'package:flutter/material.dart';
import 'package:login_flutter/dados_mock.dart';
import 'package:login_flutter/widgets/default_input.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmaSenhaController = TextEditingController();
  bool esconderSenha = false;
  bool esconderConfirmacao = false;

  void cadastrar() {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text;
    String confirmaSenha = confirmaSenhaController.text;

    if (nome.isEmpty ||
        email.isEmpty ||
        senha.isEmpty ||
        confirmaSenha.isEmpty) {
      mostrarMensagem('Preencha todos os campos');
      return;
    }
    if (!email.contains('@')) {
      mostrarMensagem('Insira um e-mail válido');
      return;
    }
    if (senha.length < 4) {
      mostrarMensagem("A senha deve possuir pelo menos 4 caracteres");
      return;
    }
    if (senha != confirmaSenha) {
      mostrarMensagem('As senhas não são iguais');
    }
    bool emailExiste = false;

    for (var usuario in usuarios) {
      if (usuario['email'] == email) {
        emailExiste = true;
        break;
      }
    }
    if (emailExiste) {
      mostrarMensagem("Já existe um cadastro com este email");
      return;
    }
    usuarios.add({'nome': nome, 'email': email, 'senha': senha});
    mostrarMensagem("Cadastro realizado com sucesso!");
    Navigator.pop(context);
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }
    @override
  void dispose(){
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmaSenhaController.dispose();
    super.dispose();
  }
  @override
  Widget build(buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar usuário'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            const SizedBox(height: 20),

            const Icon(Icons.person_add, size: 90),
            const SizedBox(height: 15),
            const Text(
              'Criar conta',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultInput(
                controller: nomeController,
                labelText: 'Nome',
                esconderSenha: false,
                tipoTeclado: TextInputType.text,
                hintText: 'Insira o nome',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultInput(
                controller: emailController,
                labelText: 'E-mail',
                esconderSenha: false,
                tipoTeclado: TextInputType.emailAddress,
                hintText: 'Insira o e-mail',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultInput(
                controller: senhaController,
                labelText: 'Senha',
                esconderSenha: esconderSenha,
                tipoTeclado: TextInputType.visiblePassword,
                hintText: 'Insira a senha',
                prefixIcon: Icon(Icons.lock),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultInput(
                controller: confirmaSenhaController,
                labelText: 'Confirmar senha',
                esconderSenha: esconderConfirmacao,
                tipoTeclado: TextInputType.visiblePassword,
                hintText: 'Confirme a senha',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderConfirmacao = !esconderConfirmacao;
                    });
                  },
                  icon: Icon(
                    esconderConfirmacao
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: cadastrar, child: Text("Cadastrar")),
          ],
        ),
      ),
    );
  }
}
