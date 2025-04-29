// ignore_for_file: avoid_print

import 'dart:io';

class ToolsHelper {
  ToolsHelper._();

  static String getfeatureScreenContentString({required String caseCamelFeatureName,required String lowerCaseFeatureName}) {
    return '''

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ${caseCamelFeatureName}Screen extends ConsumerWidget {
  const ${caseCamelFeatureName}Screen({super.key});
  static const routeName = "/${lowerCaseFeatureName}_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}

''';
  }

  static String getViewModelStateContent(String featureName) {
    return '''
class ${featureName}State {

}

''';
  }

  static String getViewModelRiverpodContent({
    required String featureName,
    required String fileName,
    required String stateFileName,
  }) {
    return '''
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/$stateFileName';
part '$fileName.g.dart';

@riverpod
class ${featureName}ViewModel extends _\$${featureName}ViewModel {
  @override
  ${featureName}State build() => ${featureName}State();

}

''';
  }

  static String camelCase(String text) {
    if (text.isEmpty) {
      return '';
    }

    List<String> words = text.toLowerCase().split('_');
    String result = '';

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        result += word[0].toUpperCase() + word.substring(1);
      }
    }

    return result;
  }

  static bool isValidFeatureName(String name) {
    return !RegExp(r'^[0-9*/_\-]').hasMatch(name);
  }

  static Future<void> createDirectoryIfNotExists(Directory dir) async {
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      print("✅ ${dir.path} Directory created successfully");
    }
  }

  static Future<void> createFile(
      {required String path, required String content}) async {
    final createdFile = File(path);
    if (!await createdFile.exists()) {
      // Add content to created file
      await createdFile.writeAsString(content);
      print('✅ Created: ${createdFile.path}');
    } else {
      print('⚠️ Already exists: ${createdFile.path}');
    }
  }
}
