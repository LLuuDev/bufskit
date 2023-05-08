import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bufskit/components/login_error_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const storage = FlutterSecureStorage();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              '로그인',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _idController,
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.username],
              cursorColor: const Color(0xff716FE9),
              style: Theme.of(context).textTheme.labelSmall,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: '학생포털시스템 아이디 (학번)',
                  hintStyle: Theme.of(context).textTheme.labelSmall),
            ),
            const Divider(
              color: Color(0xff716FE9),
              thickness: 1,
              height: 20,
            ),
            TextFormField(
              controller: _pwController,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              cursorColor: const Color(0xff716FE9),
              style: Theme.of(context).textTheme.labelSmall,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: '학생포털시스템 비밀번호',
                  hintStyle: Theme.of(context).textTheme.labelSmall),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () async {
                loginError(context);
                await storage.write(
                    key: "userId", value: _idController.text.toString());
                await storage.write(
                    key: "userPw", value: _pwController.text.toString());
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   '/splash',
                //       (route) => false,
                // );
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xff716FE9),
                ),
                child: const Center(
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
