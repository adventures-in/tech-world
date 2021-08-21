import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../enums/direction.dart';
import '../extensions/vector2_extension.dart';

typedef Point = Vector2;

class SpriteDirectionEffect
    extends ComponentEffect<SpriteAnimationGroupComponent<Direction>> {
  SpriteDirectionEffect({required this.pathPoints, required this.speed})
      : super(false, false); // sets _initialIsInfinite & _initialIsAlternating

  final List<Vector2> pathPoints;
  final double speed;
  final directionVectors = <Direction>[];

  @override
  void initialize(SpriteAnimationGroupComponent<Direction> component) {
    super.initialize(component);

    var totalPathLength = 0.0;
    for (int i = 0; i < pathPoints.length - 1; i++) {
      final subPathVector = pathPoints[i + 1] - pathPoints[i];
      directionVectors.insert(i, subPathVector.toDirection());
      totalPathLength += subPathVector.length;
    }
    // add a last vector so [directionVectors] has the same length as [path]
    if (directionVectors.isNotEmpty) {
      directionVectors.insert(pathPoints.length - 1, directionVectors.last);
    }

    super.component?.current = directionVectors.first;
    super.peakTime = totalPathLength / speed;
  }

  @override
  void update(double dt) {
    super.update(dt);

    final index = (curveProgress * (directionVectors.length - 1)).floor();
    component?.current = directionVectors[(index - 1).abs()];
  }

  @override
  void setComponentToEndState() => component?.position.setFrom(pathPoints.last);

  @override
  void setComponentToOriginalState() =>
      component?.position.setFrom(pathPoints.first);
}
