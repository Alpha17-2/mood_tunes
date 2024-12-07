import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood_tunes_prod/models/audio_model.dart';

Future<List<Audio>> getSongsBasedOnMood(String mood) async {
  List<Audio> songs = [];
  var response = await FirebaseFirestore.instance
      .collection("songs")
      .where("mood", isEqualTo: mood)
      .get();
  
  for (var i = 0; i < response.docs.length; i++) {
    Audio audio = Audio.fromMap(response.docs[i].data());
    songs.add(audio);
  }
  return songs;
}


// 1 Goal of the project -> Evaluating mood of user based on their images and suggesting songs based on their respective mood using ML 
// 2 Tech stack used and why ? Flutter for cross-platform app development, Firebase for handling the backend services like auth , storage , database etc , Teachable machine for building the ML model , FEB 2013 mood dataset from kaggle
// 3 Duration - 1 months
// 4 Problems that you faced and how did you resolve it - Not achieving good accuracy due to image sizes , unavailablilty of recent dataset , handling the app on multive devices, 
// 5 working - demo video or screen shots
