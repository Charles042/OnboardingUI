import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_UI/utils/textStyle.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 5.0,
      width: isActive ? 20.0 : 15.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/onboarding11.png'),
                                height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                              
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Connect with people\naround the world',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit. In a lorem teldolor sit ipsum dolor sit. In a lo',
                              style: kSubtitleStyle,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/onboarding12.png'),
                               height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                              
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Live your life smarter\nwith us',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit. In a lorem tellllus ullamcorper pre tedolor sit',
                              style: kSubtitleStyle,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/onboarding13.png'),
                               height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                              
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Get new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit. eget tellus ullamcorper pretium Lorem ipsum dolor sit',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 40,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Get Started'),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color(0xFF5B16D0),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
