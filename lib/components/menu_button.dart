import 'package:flutter/material.dart';

late OverlayEntry menuButton1;
late OverlayEntry menuButton2;
late OverlayEntry menuButton3;

showFloatingButton1(BuildContext context) {
  List<dynamic> items = [
    ['공지사항',(){showFloatingButton2(context);}],
    ['',''],
    ['오늘의 학식',(){}],
    ['',''],
    ['버스 시간표',(){}],
    ['',''],
    ['수업 시간표',(){}],
    ['',''],
    ['성적표',(){showFloatingButton3(context);}],
    ['',''],
    ['학생증',(){}],
    ['',''],
    ['설정',(){}],
  ];
  OverlayState overlayState = Overlay.of(context);
  menuButton1 = OverlayEntry(builder: (context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
        body: SafeArea(
            child: Stack(
          children: [
            InkWell(
              onTap: () => {menuButton1.remove()},
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () async {
                  menuButton1.remove();
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.close_rounded,
                    size: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 80,
              child: InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () async {
                  print("Dash");
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
                    Icons.star_border_rounded,
                    size: 25,
                    color: Colors.white,
                  )),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 20,
              child: Container(
                  padding: EdgeInsets.all(15),
                  width: 110.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                        items.length,
                            (index) {
                          if (index % 2 == 0) {
                            return TextButton(
                              onPressed: items[index][1],
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size.zero),
                                padding:
                                MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero),
                                tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(items[index][0],
                                  style:
                                  Theme.of(context).textTheme.bodyMedium),
                            );
                          }
                          return Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                            thickness: 1,
                            height: 30,
                          );
                        },
                      ),
                    ],
                  )),
              ),
          ],
        )));
  });
  overlayState.insert(menuButton1);
}


showFloatingButton2(BuildContext context) {
  List<dynamic> items = [
    ['일반공지',(){}],
    ['',''],
    ['학사공지',(){}],
    ['',''],
    ['장학공지',(){}],
    ['',''],
    ['취업공지',(){}],

  ];
  OverlayState overlayState = Overlay.of(context);
  menuButton2 = OverlayEntry(builder: (context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
        body: SafeArea(
            child: Stack(
              children: [
                InkWell(
                  onTap: () => {menuButton2.remove()},
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      menuButton2.remove();
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Center(
                          child: Icon(
                            Icons.close_rounded,
                            size: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 80,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      print("Dash");
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
                            Icons.star_border_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 20,
                  child: Container(
                      padding: EdgeInsets.all(15),
                      width: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          ...List.generate(
                            items.length,
                                (index) {
                              if (index % 2 == 0) {
                                return TextButton(
                                  onPressed: items[index][1],
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    minimumSize: MaterialStateProperty.all<Size>(
                                        Size.zero),
                                    padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.zero),
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(items[index][0],
                                      style:
                                      Theme.of(context).textTheme.bodyMedium),
                                );
                              }
                              return Divider(
                                color: Theme.of(context).colorScheme.tertiary,
                                thickness: 1,
                                height: 30,
                              );
                            },
                          ),
                        ],
                      )),
                ),
              ],
            )));
  });
  overlayState.insert(menuButton2);
  menuButton1.remove();
}
showFloatingButton3(BuildContext context) {
  List<dynamic> items = [
    ['학기별',(){}],
    ['',''],
    ['중간고사',(){}],
    ['',''],
    ['기말/계절',(){}],

  ];
  OverlayState overlayState = Overlay.of(context);
  menuButton3= OverlayEntry(builder: (context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
        body: SafeArea(
            child: Stack(
              children: [
                InkWell(
                  onTap: () => {menuButton3.remove()},
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      menuButton3.remove();
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Center(
                          child: Icon(
                            Icons.close_rounded,
                            size: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 80,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () async {
                      print("Dash");
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
                            Icons.star_border_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 20,
                  child: Container(
                      padding: EdgeInsets.all(15),
                      width: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          ...List.generate(
                            items.length,
                                (index) {
                              if (index % 2 == 0) {
                                return TextButton(
                                  onPressed: items[index][1],
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    minimumSize: MaterialStateProperty.all<Size>(
                                        Size.zero),
                                    padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.zero),
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(items[index][0],
                                      style:
                                      Theme.of(context).textTheme.bodyMedium),
                                );
                              }
                              return Divider(
                                color: Theme.of(context).colorScheme.tertiary,
                                thickness: 1,
                                height: 30,
                              );
                            },
                          ),
                        ],
                      )),
                ),
              ],
            )));
  });
  overlayState.insert(menuButton3);
  menuButton1.remove();
}