import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hit_fast_food/src/providers/auth.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isLoading = false;
  var _isInit = true;

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true; 
      });

      Provider.of<Auth>(context).fetchUserData().then((_) {
        setState(() {
          _isLoading = false; 
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).userInfo;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: (_isLoading)
      ? Center(child: SpinKitChasingDots(color: Colors.red, size: 50,))
      : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container( //space btw 2 widget    
            height: MediaQuery.of(context).size.height / 2.1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      color: primaryColor
                    ),
                    
                  ),
                ),

                Positioned(
                  // left: 0,
                  top: 30,
                  // right: 38,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        

                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          )
                        ),

                        // SizedBox(width: 90,),

                        SizedBox(width: 30)
                      ],
                    )
                  )
                ),

                Positioned( //position card
                  top: MediaQuery.of(context).size.height / 7,
                  // bottom: 0,
                  left: 16,
                  right: 16,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.pink, width: 2)
                            ),

                            child: Icon(Icons.account_circle, size: 60, color: Colors.grey,)
                          ),

                          SizedBox(height: 12),

                          Text(
                            user['username'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontFamily: 'CenturyGhotic'
                            ),
                          ),

                          SizedBox(height: 10),
                         
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Text(
                          //       '350 F CFA',
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     )
                          //   ],
                          // ),

                          //  Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Icon(Icons.payment, color: Colors.red, size: 17),
                          //     Text(
                          //       'Ma monnaie',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //       ),
                          //     )
                          //   ],
                          // ),

                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 24, right: 9, bottom: 16),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            user['email'], 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey[700]
                            )
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Divider(),

                Padding(
                  padding: EdgeInsets.only(top: 8, left: 24, right: 9, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "+225 ${user['phone']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey[700]
                            )
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Telephone',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height /5.5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [ 
              (_isLoading) 
              ? SpinKitFadingCircle(color: Colors.red, size: 45,)
              : Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: InkWell(
                  onTap: () async{
                    setState(() {
                      _isLoading = true;
                    });

                    try{
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/');
                      Provider.of<Auth>(context, listen: false).logout();
                    } catch (error) {
                      throw error;
                    }
                    
                     setState(() {
                      _isLoading = false;
                    });
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.power_settings_new, color: Colors.white, size: 23,),
                      Text(
                          'Deconnexion',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                    ],
                  ),
                  
                ),
              ),
            ]
          ),

          SizedBox(height: 25,),
        ],
      ),
    ),

    
  );
  }
}