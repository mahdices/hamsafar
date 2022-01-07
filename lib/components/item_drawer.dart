import 'package:flutter/material.dart';

class ItemDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? widget;
  final VoidCallback? callback;

  const ItemDrawer(
      {Key? key,
      required this.title,
      required this.icon, this.callback,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              widget ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
