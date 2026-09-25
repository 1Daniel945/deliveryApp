import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.ico,
    required this.col,
    required this.onTap,
  });

  final String title;
  final IconData ico;
  final Color col;
  final VoidCallback ? onTap;

  const ButtonWidget.withoutcol({
    super.key,
    required this.title,
    required this.ico,
    required this.onTap,
  }) : col = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: col == Colors.transparent ? col : Colors.red,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: .antiAlias,
      child: InkWell(
        hoverDuration: Duration(seconds: 0),
        highlightColor: col,
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
          child: Row(
            spacing: 10,
            children: [
              Icon(ico, size: 26, color: AppColors.primary),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
              if (col == Colors.transparent)
                Expanded(
                  child: Align(
                    alignment: .centerRight,
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
