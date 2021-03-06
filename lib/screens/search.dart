import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';
import '../components/api.dart';
import '../components/videolist.dart';

class SearchScreen extends StatefulWidget {
  final String search;
  SearchScreen({
    this.search,
  });
  @override
  SearchScreenState createState() => new SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  var content;
  var result = "loading";
  var apiData3;

  _getVideos() async {
    apiData3 = await steemit.getDiscussionsBySearch(widget.search);
    setState(() {
      apiData3 = apiData3;
    });
  }

  @override
  void initState() {
    _getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: theme(selectedTheme)["background"],
        title: new Text(widget.search),
        automaticallyImplyLeading: false,
        leading: new Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: theme(selectedTheme)["accent"],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: buildSubtitles(steemit.getDiscussionsBySearch(widget.search), context),
    );
  }
}
