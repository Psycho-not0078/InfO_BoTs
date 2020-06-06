import 'package:flutter/material.dart';
import 'package:tryn/channel_list.dart';
import 'package:tryn/tryncs.dart';
import 'Login_Screen.dart';
import 'following.dart';


void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
          home: LoginPage(),
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: new AppBar(
        backgroundColor: Colors.purple,
        title: Text('#LocalHost', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){})
        ],
      ),

      drawer: new Drawer(
        child: Container(
          color: Colors.black12,
          child: new ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text('Irrfan Khan'), accountEmail: Text('Irrfan.khan@st.niituniversity.in'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: AssetImage("Images/Irrfan Khan.jpg"),
                )
              ),
              decoration: new BoxDecoration(
                color: Colors.purple
              ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Home', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.home, color: Colors.grey),
                ),
              ),

              InkWell(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChannelList()
                  ),
                );
                },
                child: ListTile(
                  title: Text('Channels', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.live_tv, color: Colors.grey),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FollowList()
                    ),
                  );
                },
                child: ListTile(
                  title: Text('Following', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.toc, color: Colors.grey),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          chat()
                    ),
                  );
                },
                child: ListTile(
                  title: Text('DM', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.textsms, color: Colors.grey),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Profile', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.person, color: Colors.grey),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings', style: TextStyle(fontSize: 18)),
                  leading: Icon(Icons.settings, color: Colors.grey),
                ),
              ),

              Divider(),
              Divider(),
              Divider(),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Log Out', style: TextStyle(fontSize: 22)),
                  leading: Icon(Icons.arrow_forward, color: Colors.grey),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
