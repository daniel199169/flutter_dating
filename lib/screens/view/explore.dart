import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class ExplorePage extends StatefulWidget{
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  List _data = [
    {
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },{
    "name": "Amy Whitefield",

  },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Explore Page"),
      ),
      backgroundColor: Colors.black,
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
          height: height,
          child:  GridView.builder(
            itemCount: _data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: InkWell(
                  onTap: ()=> Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> ExploreProfilePage(_data[index]))),
                  child: new GridTile(
                    
                    header: Container(
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black,Colors.black.withOpacity(0.3),Colors.transparent]
                          )
                        ),
                        child: new Text(_data[index]['name'],style: TextStyle(color: Colors.white,fontSize: 15),)),
                    child: Image.asset("assets/images/placeholderProfileImage.jpg",fit: BoxFit.cover,), //just for testing, will fill with image later
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class ExploreProfilePage extends StatefulWidget {

  final userDetails;
  ExploreProfilePage(this.userDetails);

  @override
  _ExploreProfilePageState createState() => _ExploreProfilePageState();
}

class _ExploreProfilePageState extends State<ExploreProfilePage> {
  @override
  Widget build(BuildContext context) {

    final width = getWidth(context);
    final height = getHeight(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/placeholderProfileImage.jpg"
              ),
              alignment: Alignment.topCenter,

            )
          ),
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: width * 0.3,
                          alignment: Alignment.centerLeft,
                          child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: ()=> Navigator.of(context).pop(),)),
                      Container(
                          width: width * 0.3,
                          alignment: Alignment.center,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,child: Text("Explore Page",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
                      SizedBox(width: width * 0.3,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    height: height * 0.25,
                  child: Text("${widget.userDetails["name"]}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  color: Colors.black,
                  height: height * 0.7,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(

                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),


                          labelText: "Age",
                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(

                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),


                          labelText: "Race",
                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                        ),
                      ),

                      TextField(
                        decoration: InputDecoration(

                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),


                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        color: Colors.orange,
                        onPressed: (){

                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: width,child: Text("Date Request",style: TextStyle(fontSize: 15,color: Colors.white),),),
                      )

                    ],
                  ),

                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}

