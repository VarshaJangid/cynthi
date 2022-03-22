import 'package:cynthi/model/story_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoryViewModel extends BaseViewModel {
  StoryListModel? modelList;

  init(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () => storyAPI(context));
  }

  storyAPI(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse("https://codevweb.com/demo/api/story"),
      );

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        modelList = StoryListModel.fromJson(res);
        notifyListeners();
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }
}