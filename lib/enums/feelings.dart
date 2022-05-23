enum Feelings {
  heart(title: 'Heart'),
  mind(title: 'Mind'),
  soul(title: 'Soul');

  final String title;

  const Feelings({
    required this.title,
  });
}
