import 'package:flutter/material.dart';

late OverlayEntry menuButton1;

showDropdown(BuildContext context, LayerLink layerLink) {
  List<dynamic> items = [
    ['조식',(){}],
    ['',''],
    ['중식/석식',(){}],
    ['',''],
    ['정식',(){}],
    ['',''],
    ['분식',(){}],
    ['',''],
    ['공통찬',(){}],
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
            Container(
              padding: const EdgeInsets.all(20),
              child: CompositedTransformFollower(
                offset: const Offset(0, 0),
                link: layerLink,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        // width: 110.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Theme.of(context).textTheme.bodyLarge),
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
                  ],
                )
              ),
            ),
          ],
        )));
  });
  overlayState.insert(menuButton1);
}