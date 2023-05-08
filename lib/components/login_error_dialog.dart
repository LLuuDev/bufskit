import 'package:flutter/material.dart';

late OverlayEntry loginErrorDialog;
loginError(BuildContext context) {
  OverlayState overlayState = Overlay.of(context);
  loginErrorDialog =OverlayEntry(builder: (context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
        body: SafeArea(
            child: Stack(
              children: [
                InkWell(
                  onTap: () => {loginErrorDialog.remove()},
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '오류',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '로그인 실패',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                loginErrorDialog.remove();
                              },
                              style: ButtonStyle(
                                overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                                minimumSize:
                                MaterialStateProperty.all<Size>(Size.zero),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                "확인",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff716FE9)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  });
  overlayState.insert(loginErrorDialog);
}
