import 'package:flutter/material.dart';
import 'package:bufskit/components/menu_button.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // static const storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Container(),
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '대시보드',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(15.0),
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://www.instagram.com/p/CrA5TzFppX0',
                                );
                                if (await canLaunchUrl(url)) {
                                launchUrl(url);
                                } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15), // Image border
                                          child: Image.network('https://www.instagram.com/p/CrA5TzFppX0/media/?size=l',fit: BoxFit.fill,)
                                      )
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "오늘의 학식",
                                        style:
                                        Theme.of(context).textTheme.bodyLarge,
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        // 패딩 설정
                                        constraints: const BoxConstraints(),
                                        // constraints
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.chevron_right,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    thickness: 1,
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      ...List.generate(
                                        7,
                                            (index) {
                                          if (index % 2 == 0) {
                                            return Row(
                                              children: [
                                                Text(
                                                  "오늘의 학식",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                )
                                              ],
                                            );
                                          }
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "버스시간표",
                                        style:
                                        Theme.of(context).textTheme.bodyLarge,
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        // 패딩 설정
                                        constraints: const BoxConstraints(),
                                        // constraints
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.chevron_right,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    thickness: 1,
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      ...List.generate(
                                        9,
                                            (index) {
                                          if (index % 2 == 0) {
                                            return Row(
                                              children: [
                                                Text(
                                                  "캠퍼스",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                )
                                              ],
                                            );
                                          }
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),

                    )),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      showFloatingButton1(context);
                      // Navigator.pushNamedAndRemoveUntil(
                      //   context,
                      //   '/splash',
                      //       (route) => false,
                      // );
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      child: const Center(
                          child: Icon(
                            Icons.menu_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ],

            )),
      ),
    );
  }
}
