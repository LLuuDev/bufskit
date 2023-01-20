import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainButton extends StatefulWidget {
  final String _buttonIcon, _buttonName;
  final Function _buttonFunction;

  const MainButton(this._buttonIcon, this._buttonName, this._buttonFunction,
      {Key? key})
      : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                color: const Color.fromRGBO(113, 111, 233, 1),
                child: Center(
                    child: SvgPicture.asset(
                  widget._buttonIcon,
                )),
              ),
              Expanded(
                  child: Container(
                height: 55,
                color: Colors.white,
                child: Center(
                  child: Text(
                    widget._buttonName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(onTap: () {
              widget._buttonFunction();
            }),
          ),
        ),
      ],
    ));
  }
}
