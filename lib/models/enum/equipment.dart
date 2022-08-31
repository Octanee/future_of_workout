enum Equipment {
  cablePull(name: 'Cable pull', path: ''),
  bench(name: 'Bench', path: ''),
  bar(name: 'Chin up bar', path: ''),

  belt(name: 'Wight lifting belt', path: ''),
  bands(name: 'Physio bands', path: ''),
  balls(name: 'Medicine balls', path: ''),
  
  kettlebells(name: 'Kettlebells', path: ''),
  dumbbells(name: 'Dunbbells', path: ''),
  barbel(name: 'Barbel', path: '');

  const Equipment({required this.name, required this.path});

  final String name;
  final String path;
}
