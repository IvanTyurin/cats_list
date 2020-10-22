import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  double pageWidth = 0;

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats List"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 21,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index == 0) page = 0;
    int myIndex = index - page * 4;
    print(myIndex);

    if (myIndex == 2) {
      return _halfItem(context, myIndex);
    } else if (myIndex == 3) {
      page++;
      return _viewPagerItem(context, myIndex);
    } else {
      return _wideItem(context, myIndex);
    }
  }

  Widget _wideItem(BuildContext context, int myIndex) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('$myIndex'), Text(' index '), Text('app')],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            height: 2,
            child: Divider(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _halfItem(BuildContext context, int myIndex) {
    if (myIndex == 2) {
      return Row(
        children: [
          Container(
            child: _oneHalfItem(myIndex),
          ),
          Expanded(
            child: _oneHalfItem(myIndex + 1),
          ),
        ],
      );
    }
  }

  Widget _viewPagerItem(BuildContext context, int myIndex) {
    return Container(
      color: Colors.redAccent,
      width: pageWidth,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _viewPager(myIndex),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            height: 2,
            child: Divider(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewPager(int myIndex) {
    return Container(
      width: pageWidth,
      height: 100,
      child: PageView.builder(
        itemBuilder: _viewPagerBuilder,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
      ),
    );
    // return PageView.builder(
    //   itemBuilder: _viewPagerBuilder,
    //   scrollDirection: Axis.horizontal,
    // );
  }

  Widget _viewPagerBuilder(BuildContext context, int position) {
    Color col = Colors.deepPurple;
    if (position == 0) col = Colors.pink;
    if (position == 1) col = Colors.purple;
    if (position == 2) col = Colors.cyan;

    return Container(
      color: col,
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }

  Widget _oneHalfItem(int myIndex) {
    return Container(
      color: Colors.grey,
      width: pageWidth / 2.0,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('$myIndex'), Text(' index '), Text('app')],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            height: 2,
            child: Divider(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
