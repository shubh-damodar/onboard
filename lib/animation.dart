import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  final kTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'CM Sans Serif',
    fontSize: 26.0,
    height: 1.5,
  );

  final kSubtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    height: 1.2,
  );

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(12)),
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
              stops: [0.1, 0.3, 0.6, 0.9],
              colors: [
                Colors.blue[50],
                Colors.blue[200],
                Colors.blue[400],
                Colors.blue[600],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: FlatButton(
                //     onPressed: () => print('Skip'),
                //     child: Text(
                //       'Skip >>',
                //       style: TextStyle(
                //         color: Colors.black26,
                //         fontSize: 16.0,
                //       ),
                //     ),
                //   ),
                // ),C

                Container(
                  height: 600.0,
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
                                  'assets/images/onboarding0.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
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
                                  'assets/images/onboarding1.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Live your life smarter\nwith us!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
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
                                  'assets/images/onboarding2.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Get a new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
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
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _currentPage != _numPages - 1
                            ? _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              )
                            : print("Enter");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            _currentPage != _numPages - 1 ? 'Next' : "Start",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            _currentPage != _numPages - 1 ? Icons.label : null,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: _currentPage == _numPages - 1
      //     ? Container(
      //         height: 30.0,
      //         width: double.infinity,
      //         color: Colors.white,
      //         child: GestureDetector(
      //           onTap: () => print('Get started'),
      //           child: Center(
      //             child: Padding(
      //               padding: EdgeInsets.only(bottom: 30.0),
      //               child: Text(
      //                 'Get started',
      //                 style: TextStyle(
      //                   color: Color(0xFF5B16D0),
      //                   fontSize: 20.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       )
      //     : Text(''),
    );
  }
}
