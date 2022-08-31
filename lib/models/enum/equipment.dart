enum Equipment {
  rack(name: 'Rack', path: ''),
  cablePull(name: 'Cable pull', path: ''),
  flatBench(name: 'Flat bench', path: ''),
  bar(name: 'Chin up bar', path: ''),

  belt(name: 'Wight lifting belt', path: ''),
  bands(name: 'Physio bands', path: ''),
  balls(name: 'Medicine balls', path: ''),

  kettlebells(name: 'Kettlebells', path: ''),
  dumbbells(name: 'Dunbbells', path: ''),
  barbel(name: 'Barbel', path: '');

  const Equipment({
    required this.name,
    this.path = '',
  });

  final String name;
  final String path;
}
