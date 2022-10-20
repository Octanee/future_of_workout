enum Period {
  week(days: 7, name: 'Week'),
  oneMounth(days: 30, name: '1 Mounth'),
  threeMounth(days: 90, name: '3 Mounth'),
  sixMounth(days: 180, name: '6 Mounth'),
  year(days: 365, name: 'Year');

  const Period({
    required this.days,
    required this.name,
  });

  final int days;
  final String name;
}
