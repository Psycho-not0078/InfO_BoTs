import 'package:flutter/material.dart';
import 'package:tryn/tryncs.dart';

import 'channel_list.dart';
class FollowList extends StatefulWidget {
  @override
  _FollowListState createState() => _FollowListState();
}

class _FollowListState extends State<FollowList> {
  final List people = [
    "Ali Pazani",
    "Christopher Campbell",
    "Barna Kovacs",
    "Olena Sergienko",
    "Jack Finnigan",
    "Wassim Chouak",
    "Random Name",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      drawer: Drawer(child: Container(
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
      appBar: AppBar(

          backgroundColor: Colors.purple,
//        iconTheme: IconThemeData(color: Colors.blueGrey),
          textTheme: TextTheme(title: TextStyle(
              color: Colors.white,
              fontSize: 22
          )),
        title: Text("#Follows", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              channelCard(people[index], context),
              Positioned(
                left: 30,
                  top: 30.0, child: movieImage("http://picsum.photos/150")),
            ]);

          }),
    );

  }
  Widget channelCard( String channel, BuildContext context) {
    return InkWell(
      child: Container(
//        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  channel,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.0,

                                      color: Colors.grey),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Icon(Icons.navigate_next, size: 70,)
                      ]),

                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){}

    );
  }
  Widget movieImage(String imageUrl) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
