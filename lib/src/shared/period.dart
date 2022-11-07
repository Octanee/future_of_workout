enum Period {
  week(days: 7),
  oneMounth(days: 30),
  threeMounth(days: 90),
  sixMounth(days: 180),
  year(days: 365);

  const Period({required this.days});

  final int days;
}
