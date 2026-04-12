import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/widgets/app_container.dart';
import 'package:flutter/material.dart';

class CustomTitleTile extends StatelessWidget {
  const CustomTitleTile({super.key, required this.text, this.isMore = false});
  final String text;
  final bool isMore;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),
          if (isMore) Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
