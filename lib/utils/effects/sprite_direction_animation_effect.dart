import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:tech_world/shared/direction_enum.dart';
import 'package:tech_world/utils/extensions/vector2_extension.dart';

typedef Point = Vector2;

class SpriteDirectionAnimationEffect
    extends ComponentEffect<SpriteAnimationGroupComponent<DirectionEnum>> {
  SpriteDirectionAnimationEffect(
      {required this.pathPoints, required this.speed})
      : super(false, false); // sets _initialIsInfinite & _initialIsAlternating

  final IList<Vector2> pathPoints;
  final double speed;
  final directions = <DirectionEnum>[];

  @override
  void initialize(SpriteAnimationGroupComponent<DirectionEnum> component) {
    super.initialize(component);

    var totalPathLength = 0.0;
    for (int i = 0; i < pathPoints.length - 1; i++) {
      final subPathVector = pathPoints[i + 1] - pathPoints[i];
      directions.insert(i, subPathVector.toDirection());
      totalPathLength += subPathVector.length;
    }
    // add a last vector so [directions] has the same length as [path]
    if (directions.isNotEmpty) {
      directions.insert(pathPoints.length - 1, directions.last);
    }

    super.component?.current = directions.first;
    super.peakTime = totalPathLength / speed;
  }

  @override
  void update(double dt) {
    super.update(dt);

    final index = (curveProgress * (directions.length - 1)).floor();
    component?.current = directions[(index - 1).abs()];
  }

  @override
  void setComponentToEndState() => component?.position.setFrom(pathPoints.last);

  @override
  void setComponentToOriginalState() =>
      component?.position.setFrom(pathPoints.first);
}
