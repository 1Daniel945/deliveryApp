import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class ConfigurationCards extends StatelessWidget {

  final String title;
  final String description;
  final Icon icon;
  final VoidCallback onTap;

  const ConfigurationCards({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: AppColors.border),
          borderRadius: .circular(12),
        ),
        child: Row(
          spacing: 16,
          mainAxisAlignment: .spaceBetween,
          children: [
            Icon(icon.icon),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: .bold, fontSize: 16),
                    overflow: .ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    description,
                    style: TextStyle(fontWeight: .normal, fontSize: 14),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
