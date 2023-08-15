import 'package:flutter/cupertino.dart';

class Hover extends StatefulWidget{
  final Widget Function(bool isHovered) builder;
  const Hover({Key? key, required this.builder}) : super(key : key);

  @override
  State<Hover> createState() => _HoverState();
}

class _HoverState extends State<Hover>{
  bool isHovered = false;

  @override
  Widget build(BuildContext context){
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = hoveredTransform;
    return MouseRegion(
      onEnter: (event)=> onEntered(true),
      onExit: (event)=> onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder(isHovered),
      )
    );
  }

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}