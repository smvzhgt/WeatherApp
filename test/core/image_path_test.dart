import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/image_assets_path.dart';

void main() {
  group('getImagePath function', () {
    test('should return right image path when input image name', () async {
      const tImageName = "h";
      const tExpectedPath = "assets/icons/h.svg";
      expect(getImagePath(tImageName), tExpectedPath);
    });
  });
}
