import 'package:finalproj/utilities/Categories.dart';
import 'package:finalproj/utilities/Dashboard.dart';
import 'package:finalproj/utilities/Recommended.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget {
  
  HomePage({ Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final text = TextStyle(fontSize: 18);

  final List professions = [
    ['assets/plumber1.jpg', '3.8', 'plumbing', 'Edward louis', '23', '30'],
    ['assets/cleaner1.jpg', '4', 'Cleaning', 'letti disuza', '17', '25'],
    ['assets/electrician.jpg', '4.5', 'Electric', 'Cris Danzo', '27', '10'],
    ['assets/newpainter.jpg', '3.9', 'Painting', 'Morris huawie', '22', '15']
  ];

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        // appbar
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[300],
         
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepOrange[100],
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1577880216142-8549e9488dad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                ),
                accountName:Text('Saddam Hussain',style: TextStyle(color: Colors.black),) ,
                 accountEmail: Text(''+user.email!,style: TextStyle(color: Colors.black)),
                 decoration:BoxDecoration(
                  color: Colors.deepOrange[300],
                  
                 )
                 ),
                 ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("log out"),
                  onTap: (){
                    FirebaseAuth.instance.signOut();                  },
                 )
    
            ],
          ),
        ),
    
        //bottom Navigation
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ]),
        body: SingleChildScrollView(
      
            child: Column(
              children: [
                // dashboard style
                Container(
                  height: 177,
                  width: 666,
                 
                  child: Dashboard(),
                ),
                SizedBox(
                  height: 5,
                ),
                //Categories text
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Category",
                        style: GoogleFonts.ubuntu(textStyle: text),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey[888],
                  height: 133,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Categories
                        Categorie(
                            Cateimagepath: 'assets/newclean.jpg',
                            Categname: 'Cleaning'),
                        Categorie(
                            Cateimagepath: 'assets/newaint.jpg',
                            Categname: 'Painting'),
                        Categorie(
                            Cateimagepath: 'assets/tool.png',
                            Categname: 'Plumbing'),
                        Categorie(
                            Cateimagepath: 'assets/newelectric.jpg',
                            Categname: 'Electrician'),
                        Categorie(
                            Cateimagepath: 'assets/paint-roller.png',
                            Categname: 'paint'),
                        Categorie(
                            Cateimagepath: 'assets/mop.png',
                            Categname: 'sweeping'),
                        Categorie(
                            Cateimagepath: 'assets/laundry.png',
                            Categname: 'laundry'),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Recommended",
                        style: GoogleFonts.ubuntu(textStyle: text),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 222,
                  child: ListView.builder(
                      itemCount: professions.length,
                      itemBuilder: ((context, index) {
                        return Recommend(
                          Recimgpath: professions[index][0],
                          Ratting: professions[index][1],
                          Field: professions[index][2],
                          Recname: professions[index][3],
                          Price: professions[index][4],
                          discount: professions[index][5],
                        );
                      })),
                ),
                // Container(
                //   height: 44,
                //   color: Colors.black,
                // )
              ],
            ),
          
        ),
      ),
    );
  }
}
