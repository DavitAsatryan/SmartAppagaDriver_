import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToWidget(
      {Key? key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 180)})
      : super(key: key);

  @override
  _ScrollToWidgetState createState() => _ScrollToWidgetState();
}

class _ScrollToWidgetState extends State<ScrollToWidget> {
  bool isVisible = true;
  @override
  void initState() {
    widget.controller.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    //  final diraction = widget.controller.position.userScrollDirection;
    if (widget.controller.positions.last.userScrollDirection ==
        ScrollDirection.reverse) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 155 : 0,
      child: Wrap(children: [widget.child]),
    );
  }
}
