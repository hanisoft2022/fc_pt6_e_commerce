String twoDigits(int n) => n.toString().padLeft(2, '0');

String formatDuration(Duration duration) {
  if (duration <= Duration.zero) return 'TIME OUT';

  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
}
