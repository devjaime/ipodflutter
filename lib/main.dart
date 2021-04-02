import 'package:flutter/material.dart';

List images = [
     'https://media4.giphy.com/media/COXKkN84llq3S/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp',
  'https://media1.giphy.com/media/iwQESX0sq6p0I/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp',
   'https://media3.giphy.com/media/PkR5Tgf29uz1m/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp',
    'https://media3.giphy.com/media/l2JIlbHvldbHcKeHK/200w.webp?cid=ecf05e47n93cri0o8o8o2zkrz9z1pp98fxyal48dv9y47kpw&rid=200w.webp',
     'https://media2.giphy.com/media/uYmUUXYdujASQ/giphy.gif?cid=ecf05e47mor6jximbzspj4nezkkiiiem8em375muw1eo3e8a&rid=giphy.gif',
      'https://media1.giphy.com/media/3PqlK7A1nIjCg/200w.webp?cid=ecf05e472thh8znoglkti6dkiqp4npgp160gi07u5oje3r08&rid=200w.webp'
      'https://media4.giphy.com/media/COXKkN84llq3S/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp',
   'https://media4.giphy.com/media/COXKkN84llq3S/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp',
  'https://media4.giphy.com/media/137Glf1Eu85P0s/200w.webp?cid=ecf05e47n93cri0o8o8o2zkrz9z1pp98fxyal48dv9y47kpw&rid=200w.webp',
   'https://media3.giphy.com/media/12YliPpsL8HJPG/200w.webp?cid=ecf05e47q24sx7rn35gjuhcy9imv8mplsyj2ay48kj1g2548&rid=200w.webp',
    'https://media3.giphy.com/media/l2JIlbHvldbHcKeHK/200w.webp?cid=ecf05e47n93cri0o8o8o2zkrz9z1pp98fxyal48dv9y47kpw&rid=200w.webp',
     'https://media2.giphy.com/media/uYmUUXYdujASQ/giphy.gif?cid=ecf05e47mor6jximbzspj4nezkkiiiem8em375muw1eo3e8a&rid=giphy.gif',
      'https://media1.giphy.com/media/3PqlK7A1nIjCg/200w.webp?cid=ecf05e472thh8znoglkti6dkiqp4npgp160gi07u5oje3r08&rid=200w.webp'
      'https://media4.giphy.com/media/COXKkN84llq3S/giphy.webp?cid=ecf05e470cqv7pm3grn6docdlcgpzkge2oi1by6w8dn6ggfx&rid=giphy.webp'
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        canvasColor: Colors.white70),
      home: Scaffold(
        body: IPod(),
      ),
    );
  }
}

class IPod extends StatefulWidget {
  IPod({Key key}) : super(key: key);

  @override
  _IPodState createState() => _IPodState();
}

class _IPodState extends State<IPod> {
  final PageController _pageCtrl = PageController(viewportFraction: 0.6);

  double currentPage = 0.0;

  @override
  void initState() {
    _pageCtrl.addListener(() {
      setState(() {
        currentPage = _pageCtrl.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black,
            
            child: PageView.builder(
              controller: _pageCtrl,
              scrollDirection: Axis.horizontal,
              itemCount: 9, //Colors.accents.length,
              itemBuilder: (context, int currentIdx) {
                return AlbumCard(
                  color: Colors.accents[currentIdx],
                  idx: currentIdx,
                  currentPage: currentPage,
                );
              },
            ),
          ),
          Spacer(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onPanUpdate: _panHandler,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      gradient: RadialGradient(
                      colors: [
                        Colors.black.withOpacity(0.55),
                        Colors.black.withOpacity(0.55),
                      ],
                      center: AlignmentDirectional(0.15, 0.15),
                      focal: AlignmentDirectional(0, 0),
                      radius: 0.5,
                      focalRadius: 0,
                      stops: [0.75,
                        1.0],
                    ),
                      boxShadow: [
                            BoxShadow(
                                color: Colors.black26.withOpacity(0.15),
                                offset: Offset(-10, -10),
                                blurRadius: 20,
                                spreadRadius: 0),
                            BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.15),
                                offset: Offset(10, 10),
                                blurRadius: 20,
                                spreadRadius: 0)
                          ]
                    ),
                    child: Stack(children: [
                      Container(
                        child: Text(
                          'MENU',
                          style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 36),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.fast_forward),
                          iconSize: 40,
                          onPressed: () => _pageCtrl.animateToPage(
                           (_pageCtrl.page + 1).toInt(),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn
                            ),
                        ),
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 30),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.fast_rewind),
                          iconSize: 40,
                          onPressed: () => _pageCtrl.animateToPage(
                           (_pageCtrl.page - 1).toInt(),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn
                            ),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 30),
                      ),
                      Container(
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                        ),
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 30),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.45,
                        1
                      ],
                       colors: [
                        Colors.white70,
                        Colors.white70.withOpacity(0)
                       ]),
                     
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void _panHandler(DragUpdateDetails d) {

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= 150; // 150 == radius of circle
    bool onLeftSide = d.localPosition.dx <= 150;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Absoulte change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double vert = (onRightSide && panUp) || (onLeftSide && panDown)
        ? yChange
        : yChange * -1;

    double horz = (onTop && panLeft) || (onBottom && panRight) 
        ? xChange 
        : xChange * -1;

    // Total computed change with velocity
    double scrollOffsetChange = (horz + vert) * (d.delta.distance * 0.2);

    // Move the page view scroller 
    _pageCtrl.jumpTo(_pageCtrl.offset + scrollOffsetChange);
  }
}

class AlbumCard extends StatelessWidget {
  final Color color;
  final int idx;
  final double currentPage;
  AlbumCard({this.color, this.idx, this.currentPage});

  @override
  Widget build(BuildContext context) {
    double relativePosition = idx - currentPage;

    return Container(
      width: 250,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.003) // add perspective
          ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
          ..rotateY(relativePosition),
        // ..rotateZ(relativePosition),
        alignment: relativePosition >= 0
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(images[idx]),
            ),
          ),
        ),
      ),
    );
  }
}
