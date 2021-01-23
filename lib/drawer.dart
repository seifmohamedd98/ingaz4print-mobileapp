import 'package:flutter/material.dart';
import 'categories.dart';
import 'login.dart';
import 'signup.dart';
import 'cart.dart';
import 'edit_account.dart';
import 'create_internal_account.dart';
import 'paper_properties.dart';
import 'modify_categories.dart';
import 'category_samples_modify.dart';

void main() {
  runApp(HeaderDrawer());
}

//GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class HeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Admin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          "Role: Admin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.account_box,
                          size: 70,
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home Page',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Signup',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Categories(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text(
                'Edit Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAccount(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.badge),
              title: Text(
                'Create Internal Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccount(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.all_inbox),
              title: Text(
                'Paper Properties',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaperProperties(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.all_inbox),
              title: Text(
                'Modify Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModifyCategories(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.all_inbox),
              title: Text(
                'Category Samples',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategorySamples(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
