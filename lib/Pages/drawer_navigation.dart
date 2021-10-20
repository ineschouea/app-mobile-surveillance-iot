
import 'package:flutter/material.dart';
import 'package:map/Screens/Welcome/welcome_screen.dart';


import '../constants.dart';
import 'home.dart';



class DrawerNavigaton extends StatefulWidget {
  @override
  _DrawerNavigatonState createState() => _DrawerNavigatonState();
}

class _DrawerNavigatonState extends State<DrawerNavigaton> {

  //CategoryService _categoryService = CategoryService();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
   /*var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(
          onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>new TodosByCategory(category: category['name'],))),
          child: ListTile(
            title: Text(category['name']),
          ),
        ));
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryLightColor,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static.mediapart.fr/etmagine/default/files/media_398794/femmebrascroises_Small.jpg?width=317&height=343&width_format=pixel&height_format=pixel'),
              ),
              accountName: Text('Ines Chouea'),
              accountEmail: Text('ines.chouia@etudiant-enit.tn'),
              decoration: BoxDecoration(color: kPrimaryColor),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Log Out'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>WelcomeScreen())),
            ),

          ],
        ),
      ),
    );
  }
}
