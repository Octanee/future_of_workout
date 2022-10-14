enum ChartType {
  weight(name: 'Weight'),
  volume(name: 'Volume'),
  oneRepMax(name: '1RM');

  const ChartType({required this.name});

  final String name;
}
