import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Container(
              width: 210,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {
                    print('Button Clicked.');
                  },
                  textColor: Colors.white,
                  color: Colors.pink,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.pink,
                            padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                            child: Text(
                              'Button With Right Icon',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                            child: Icon(
                              Icons.backup,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ))))
          // MaterialButton(
          //   child: Text('Sign in with GitHub'),
          //   onPressed: () {},
          // ),
          ),
    );
  }
}
