import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  
  TabsScreen(this.favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // we cannot used widget keyword while creating properties 
  // therefore we use initstate to create Property so we can use widget
   List<Map<String, Object>> _pages ;

  int _selectedPageIndex=0;

  @override
  void initState() {
   _pages = [
    {
      'page':CategoriesScreen(),
      'title':"Categories",
    },
    {
      'page':FavoritesScreen(widget.favoritesMeals),
      'title':"Your Favorites",
    },
  ];
    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),

      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting, // for this add background in bottom navigationbaritem to see background color
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}


//  // one way to tabbar
//     // use to add tabBar at bottom of appbar (means above but below tabbar)
//     return DefaultTabController(
//       length: 2, // no. of tab
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Categories",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "Favorites",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );