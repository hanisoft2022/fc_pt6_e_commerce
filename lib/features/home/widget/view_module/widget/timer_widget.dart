import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../../../core/core.dart';

class TimerWidget extends StatefulWidget {
  final DateTime endTime;

  const TimerWidget({super.key, required this.endTime});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late Duration remainTime;

  @override
  void initState() {
    super.initState();

    remainTime = widget.endTime.difference(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainTime = widget.endTime.difference(DateTime.now());
      });

      if (remainTime.inSeconds <= 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDuration(remainTime),
      style: context.textTheme.headlineMedium
          ?.copyWith(color: context.colorScheme.contentPrimary)
          .semiBold,
    );
  }
}
