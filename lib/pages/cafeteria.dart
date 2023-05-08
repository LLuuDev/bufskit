import 'package:flutter/material.dart';
import 'package:bufskit/components/menu_button.dart';
import 'package:bufskit/components/dropdown.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CafeteriaPage extends StatefulWidget {
  const CafeteriaPage({Key? key}) : super(key: key);

  @override
  State<CafeteriaPage> createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
  // static const storage = FlutterSecureStorage();
  final LayerLink layerLink = LayerLink();

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
                          '오늘의 학식',
                          style: Theme.of(context).textTheme.titleMedium,
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
                                    "운영시간",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "조식",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              "08:00 ~ 09:00",
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
                        CompositedTransformTarget(
                          link: layerLink,
                          child: Container(
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
                                      "조식",
                                      style:
                                      Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      // 패딩 설정
                                      constraints: const BoxConstraints(),
                                      // constraints
                                      onPressed: () {
                                        showDropdown(context,layerLink);
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
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
                                                "감자수제비국",
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
