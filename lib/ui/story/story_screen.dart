import '../../model/story_model.dart';
import '/ui/story/story_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoryViewModel>.reactive(
      viewModelBuilder: () => StoryViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
            body: viewModel.modelList == null ||
                    viewModel.modelList!.listStoryModelList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : storyWidget(viewModel));
      },
    );
  }

  Widget storyWidget(StoryViewModel viewModel) => StoryView(
        storyItems: viewModel.modelList!.listStoryModelList.map((e) {
          return StoryItem.inlineImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            controller: viewModel.storyController,
            caption: Text(
              "Hektas, sektas and skatad",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontSize: 17,
              ),
            ),
          );
        }).toList(),
        controller: viewModel.storyController,

        // StoryItem.pageVideo(
        //   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        //   controller: viewModel.storyController,
        // ),
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
          // AppRoutes.dismiss(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
      );
}
