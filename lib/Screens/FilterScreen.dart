// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mainDawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/Filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.saveFilters, this.currentFilter, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  initState() {
    _GlutenFree = widget.currentFilter['gluten']!;
    _LactoseFree = widget.currentFilter['lactose']!;
    _Vegan = widget.currentFilter['vegan']!;
    _Vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  Widget buildListTile(String title, String subtitle, bool currentValue,
      void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      activeColor: Theme.of(context).primaryColor,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const mainDrawer(),
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegetarian': _Vegetarian,
                'vegan': _Vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(
              child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              buildListTile(
                  "Gluten Free", "Select gluten-free meals", _GlutenFree,
                  (newValue) {
                setState(() {
                  _GlutenFree = newValue;
                });
              }),
              buildListTile(
                  "Lactose Free", "Select lactose-free meals", _LactoseFree,
                  (newValue) {
                setState(() {
                  _LactoseFree = newValue;
                });
              }),
              buildListTile(
                  "Vegetarian", "Select vegetarians meals", _Vegetarian,
                  (newValue) {
                setState(() {
                  _Vegetarian = newValue;
                });
              }),
              buildListTile("Vegan", "Select vegan meals", _Vegan, (newValue) {
                setState(() {
                  _Vegan = newValue;
                });
              }),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).popAndPushNamed(mainDrawer.routName);
        },
      ),
    );
  }
}
