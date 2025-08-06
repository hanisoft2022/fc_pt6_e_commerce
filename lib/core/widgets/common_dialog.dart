import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonDialog {
  /// 에러 표기 다이얼로그
  static Future<bool?> errorDialog(BuildContext context, ErrorResponse error) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 100,
          child: Column(children: [Text(error.message.toString()), Text(error.code.toString())]),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(onPressed: () => context.pop(true), child: Text('다시 시도')),
          ElevatedButton(onPressed: () => exit(10), child: Text('앱 종료')),
        ],
      ),
    );
  }
}
