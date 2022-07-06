import 'package:flutter/material.dart';

import '../Screens/FilterScreen.dart';

class mainDrawer extends StatelessWidget {
  static const routName="mainDrawer";

  const mainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext ctx,String title,IconData icon,Function tapHandle){
    return ListTile(
      leading: Icon( icon ,size: 26,color: Theme.of(ctx).primaryColor,),
      title: Text(title,style: const TextStyle(
        fontSize: 25,
        fontFamily: "RobotoCondensed",
        fontWeight: FontWeight.w600,
      ),
      ),
      onTap: (){tapHandle();},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Theme.of(context).accentColor.withOpacity(0.8),
                child: Text("Cooking Up",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    color:  Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height:20),
              buildListTile(context,"Meals",(Icons.restaurant),(){Navigator.of(context).pushReplacementNamed('/');}),
              buildListTile(context,"Filters",(Icons.settings),(){Navigator.of(context).pushReplacementNamed( FiltersScreen.routName);}),
            ],
          ),
        ),
      ),
    );
  }
}
