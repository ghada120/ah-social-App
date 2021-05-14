import 'package:flutter/material.dart';
import 'package:gpst_app/Group_Names.dart';

List groupInfo = [
  {
    "groupName": "Life",
    "groupPic": "Image/try1.jpg",
  },
  {
    "groupName": "flowers",
    "groupPic": "Image/try2.jpg",
  },
  {
    "groupName": "paradies",
    "groupPic": "Image/try1.jpg",
  },
];

class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(112, 112, 112, 1),
          title: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.crop_portrait),
                iconSize: 20,
                onPressed: () => _jumpback(context),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Groups',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: groupsPage(),
        ),
      ),
    );
  }
}

class groupsPage extends StatefulWidget {
  //FIXME pic  not a string
  String groupName, groupPic;
  groupsPage({
    @required this.groupName,
    @required this.groupPic,
  });
  @override
  _groupsPageState createState() => _groupsPageState();
}

class _groupsPageState extends State<groupsPage> {
  double screenHeight, screenWidth;
  final GlobalKey<FormState> _groupSearchTextField = GlobalKey();
  var _groupData = {
    'Search': ' ',
  };
  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight * 0.024),
            //Search field
            Container(
              height: screenHeight * 0.0889,
              width: screenWidth * 0.98,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              // color: Colors.pinkAccent,
              child: Form(
                key: _groupSearchTextField,
                child: Card(
                  //change line to be inside0.............
                  margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.008,
                      horizontal: screenWidth * 0.04),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search for a group...",
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: screenHeight * 0.0172,
                          color: Color.fromRGBO(112, 112, 112, 1)),
                      // border: new OutlineInputBorder(
                      //   borderSide: new BorderSide(
                      //     color: Color.fromRGBO(255, 0, 255, 1),
                      //   ),
                      // ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val.isEmpty) {
                        //FIXME
                        return "??";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _groupData['Search'] = val;
                      print(_groupData['Search']);
                    },
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  //   side: BorderSide(
                  //     width: screenWidth * 0.002,
                  //     color: Color.fromRGBO(0, 0, 0, 0.12),
                  //   ),
                  // ),
                ),
              ),
            ),
            ...List.generate(
              groupInfo.length,
              (index) => groupView(
                groupName: groupInfo[index]["groupName"],
                groupPic: groupInfo[index]["groupPic"],
              ),
            ).toList()
          ],
        ),
      ),
    );
  }
}

//Group View
class groupView extends StatelessWidget {
  double screenHeight, screenWidth;
  String groupName, groupPic;

  groupView({
    @required this.groupName,
    @required this.groupPic,
  });

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.016),
        //Avatar+GName+enter button
        Container(
          height: screenHeight * 0.1158,
          width: screenWidth * 0.925,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(112, 112, 112, 0.3)),
            borderRadius: BorderRadius.circular(screenHeight * 0.0197),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Avatar
              //FIXME: fitting
              Container(
                width: screenWidth * 0.13,
                height: screenHeight * 0.07,
                margin: EdgeInsets.all(screenHeight * 0.02),
                child: CircleAvatar(
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(screenHeight * 0.06),
                  //   child: Image.asset(groupPic, fit: BoxFit.fill),
                  // ),
                  backgroundImage: AssetImage(groupPic),
                  radius: screenHeight * 0.04,
                ),
              ),
              //Group name
              Container(
                width: screenWidth * 0.208,
                height: screenHeight * 0.023,
                child: Text(
                  groupName,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: screenHeight * 0.0172,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.22),
              //Enter button
              Container(
                height: screenHeight * 0.04,
                width: screenWidth * 0.26,
                child: RaisedButton(
                  color: Color.fromRGBO(79, 98, 196, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.018),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.07,
                      vertical: screenHeight * 0.01),
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: screenHeight * 0.0172,
                    ),
                  ),
                  onPressed: () => _jump(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _jumpback(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(builder: (_) {
      //FIXME: return Partner's 1st page
      //return ;
    }),
  );
}

void _jump(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(builder: (_) {
      return groupsNamePage();
    }),
  );
}
