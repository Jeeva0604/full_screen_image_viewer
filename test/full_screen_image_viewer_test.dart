import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_screen_image_viewer/full_screen_image_viewer.dart';

void main() {
  testWidgets('FullScreenImageViewer displays images correctly',
      (WidgetTester tester) async {
    List<ImageProvider> images = [
      NetworkImage("https://jeeva.com/flutter_developer.png"),
      AssetImage("assets/yaash_mart_image.jpg"),
      MemoryImage(Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: FullScreenImageViewer(
          images: images,
          initialIndex: 0,
          showIndicator: true,
        ),
      ),
    );

    // Verify that the image is displayed
    expect(find.byType(FullScreenImageViewer), findsOneWidget);
  });
}
