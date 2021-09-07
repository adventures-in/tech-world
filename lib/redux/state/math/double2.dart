class Double2 {
  Double2(this.x, this.y);
  num x;
  num y;

  Map<String, dynamic> toJson() => <String, num>{'x': x, 'y': y};
  factory Double2.fromJson(Map<String, dynamic> json) =>
      Double2(json['x'] as num, json['y'] as num);

  @override
  String toString() => '{x: $x, y: $y}';
}
