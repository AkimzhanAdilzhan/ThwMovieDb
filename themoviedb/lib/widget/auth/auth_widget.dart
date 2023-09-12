import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь чтобы начать ',
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Регистрация'),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения,нажмите здесь, чтобы отправить письмо повторно.',
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Подтверждение почты'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      final navigator = Navigator.of(context);
      navigator.pushNamed(
        ('/main_screen'),
      );
    } else {
      errorText = 'Не верный логин или пароль';
      print(errorText);
    }
    setState(() {});
  }

  void _resetPasssword() {
    print("сбросить пароль");
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));
    final textFieldDecoration = const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    final color = const Color(0xFF01B4E4);
    final errorText = this.errorText;
    //01B4E4
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          )
        ],
        Text(
          'Имя пользователя',
          style: textstyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'Пароль',
          style: textstyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              onPressed: () {
                _auth();
              },
              child: Text('Войти'),
            ),
            SizedBox(
              width: 30,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(color),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              onPressed: () {},
              child: Text('Сбросить пароль'),
            )
          ],
        )
      ],
    );
  }
}
