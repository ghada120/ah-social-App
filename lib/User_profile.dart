import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Edit_Profile.dart';

//.......................................................
//when writing the comment ,what's the next in design
//function of all raised buttons
//state managment +likes behaviour
//.......................................................

List userPostData = [
  {
    "userName": "Ghada Ahmed Hassan ",
    "userPhoto": 'Image/try1.jpg',
    "userPost":
        "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph",

    "likes": 20,
    "likedByMe": false,
    //(Month day, year, hour:min  (AM/PM))
    "postFullDate": "Dec 24, 2021,2:26 AM",
    // "Comment"
  },
];

class UserProf extends StatelessWidget {
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
                onPressed: () => _jump(context),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'My Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: userProfPage(
              userName: 'Ghada Ahmed',
              userPhoto: 'Image/try1.jpg',
              userPosts: 'Ab'),
        ),
      ),
    );
  }
}

class userProfPage extends StatefulWidget {
  String userName, userPhoto, userPosts;
  userProfPage(
      {@required this.userName,
      @required this.userPhoto,
      @required this.userPosts});
  @override
  _userProfPageState createState() => _userProfPageState();
}

class _userProfPageState extends State<userProfPage> {
  double screenHeight, screenWidth;
//  String userName , userPhoto, userPosts;
  final GlobalKey<FormState> _myTextPostUserProfileTextField = GlobalKey();
  final GlobalKey<FormState> _commentPostUserProfileTextField = GlobalKey();
  Map<String, String> _postData = {
    'MypostText': ' ',
    'Comment': ' ',
  };

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Cover photo &profile pic
          Container(
            height: screenHeight * 0.239,
            width: screenWidth,
            child: Stack(
              //alignment: Alignment.bottomCenter,
              children: <Widget>[
                //cover image
                Positioned(
                  top: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.206,
                    child: Image.asset(
                      "Image/try1.jpg",
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                //profile photo
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    //Same as User Name width
                    radius: screenHeight * 0.075,
                    backgroundImage: AssetImage('Image/try2.jpg'),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: screenHeight * 0.02,
          ),
          //User Name
          Container(
            width: screenWidth * 0.28,
            // margin: EdgeInsets.only(
            //     left: screenWidth * 0.3, right: screenWidth * 0.3),
            child: Text(
              widget.userName, //go to the parent of this
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
          ),
          //Edit Profile button
          Container(
            //outside
            margin: EdgeInsets.fromLTRB(screenWidth * 0.3, screenHeight * 0.007,
                screenWidth * 0.3, screenHeight * 0.034),
            child: RaisedButton(
              color: Color.fromRGBO(112, 112, 112, 1),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              //inside
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.038,
                  vertical: screenHeight * 0.01),
              //ON press ...>jump to edit profile screen
              onPressed: () => _jump(context),
            ),
          ),
          // What's on ur mind + 2 buttons
          Container(
            height: screenHeight * 0.155,
            width: screenWidth * 0.925,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 0.3)),
              borderRadius: BorderRadius.circular(screenHeight * 0.0209),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            //Text field
            child: Column(
              children: <Widget>[
                SizedBox(height: screenHeight * 0.018),
                Container(
                  height: screenHeight * 0.0566,
                  width: screenWidth * 0.856,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          blurRadius: screenHeight * 0.02)
                    ],
                    border: Border.all(
                        color: Color.fromRGBO(112, 112, 112, 0.3),
                        width: screenWidth * 0.001),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Form(
                    key: _myTextPostUserProfileTextField,
                    child: TextFormField(
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        border: InputBorder.none,
                        hintText: "  What's on your mind?",
                        hintStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: screenHeight * 0.0172,
                            color: Color.fromRGBO(112, 112, 112, 1)),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "??";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _postData['MyPostText'] = val;
                        print(_postData['MyPostText']);
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02339),
                //two Raised button{upload image , Post}
                Row(
                  children: <Widget>[
                    SizedBox(width: screenWidth * 0.0346),
                    Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.3,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.019),
                        ),
                        color: Color.fromRGBO(112, 112, 112, 1),
                        child: Row(
                          children: [
                            Text(
                              "Upload Image",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.018),
                            Icon(
                              Icons.crop_portrait,
                              size: screenHeight * 0.018,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ],
                        ),
                        //FIXME:continue
                        // onPressed: onPressed
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.25),
                    Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.3,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.019),
                        ),
                        color: Color.fromRGBO(79, 98, 196, 1),
                        child: Text(
                          "Post",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: screenHeight * 0.017,
                          ),
                        ),
                        //FIXME:continue
                        //onPressed: ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Posts
          ...List.generate(
            userPostData.length,
            (index) => postView(
                userName: userPostData[index]["userName"],
                userPhoto: userPostData[index]["userPhoto"],
                userPost: userPostData[index]["userPost"],
                likes: userPostData[index]["likes"],
                likedByMe: userPostData[index]["likedByMe"],
                inverseLikeState: userPostData[index]["inverseLikeState"],
                postFullDate: userPostData[index]["postFullDate"]),
          ).toList()
        ],
      ),
    );
  }
}

class postView extends StatelessWidget {
  double screenHeight, screenWidth;
  String userName, userPhoto, userPost, postFullDate;
  int likes;
  bool likedByMe;
  Function inverseLikeState;
  postView(
      {@required this.userName,
      @required this.userPhoto,
      @required this.userPost,
      @required this.likes,
      @required this.likedByMe,
      @required this.inverseLikeState,
      @required this.postFullDate});

  final GlobalKey<FormState> _MyTextPostUserProfileTextField = GlobalKey();
  final GlobalKey<FormState> _CommentPostUserProfileTextField = GlobalKey();
  Map<String, String> _PostData = {
    'MypostText': ' ',
    'Comment': '',
  };

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.0234),
        //Post view
        Container(
          height: screenHeight * 0.38,
          width: screenWidth * 0.925,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(112, 112, 112, 0.3)),
            borderRadius: BorderRadius.circular(screenHeight * 0.019),
          ),
          child: Column(
            children: [
              //pic+name+date
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Profile pic
                  Container(
                    margin: EdgeInsets.all(screenHeight * 0.02),
                    child: CircleAvatar(
                      // backgroundColor: Colors.yellowAccent,
                      backgroundImage: AssetImage(userPhoto),
                      radius: screenHeight * 0.04,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  //User name &date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //useername
                      Text(
                        userName,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: screenHeight * 0.0172,
                        ),
                      ),
                      //fulldate
                      Text(
                        postFullDate,
                        style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //POst
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.82,
                child: SingleChildScrollView(
                  child: Text(
                    userPost,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: screenHeight * 0.013,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.018),
              // likes number
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: screenWidth * 0.035),
                    Icon(Icons.crop_portrait, size: screenHeight * 0.02),
                    SizedBox(width: screenWidth * 0.038),
                    Text((likes + (likedByMe ? 1 : 0)).toString()),
                  ],
                ),
              ),
              //divider
              SizedBox(
                width: screenWidth * 0.86,
                child: Divider(
                  height: screenWidth * 0.01,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
              ),
              //Like +icon
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        size: screenWidth * 0.045,
                        color: likedByMe
                            ? Color.fromRGBO(0, 0, 255, 0.8)
                            : Color.fromRGBO(0, 0, 0, 0.8),
                      ),
                      onPressed: () {
                        inverseLikeState();
                      }),
                  Text(
                    "Like",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.015,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.001),

              //write a comment
              Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.856,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                      color: Color.fromRGBO(112, 112, 112, 0.3),
                      width: screenWidth * 0.001),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Form(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      CircleAvatar(
                        radius: screenHeight * 0.02,
                        backgroundImage: AssetImage(userPhoto),
                      ),
                      Container(
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.6,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Write a Comment...",
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: screenHeight * 0.0172,
                              color: Color.fromRGBO(112, 112, 112, 1),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Write your Comment";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            _PostData['Comment'] = val;
                            print(_PostData['Comment']);
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.029),
                      IconButton(
                        icon: Icon(
                          Icons.crop_portrait,
                          size: screenHeight * 0.019,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        //FIXME:continue
                        //onPressed: onPressed
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }
}

//jump to edit profile screen

void _jump(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(builder: (_) {
      return EditProfile();
    }),
  );
}
