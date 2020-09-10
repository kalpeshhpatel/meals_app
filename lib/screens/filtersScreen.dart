import 'package:flutter/material.dart';
import '../widgets/appDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget._currentFilters['gluten'];
    _isLactoseFree = widget._currentFilters['lactose'];
    _isVegan = widget._currentFilters['vegan'];
    _isVegetarian = widget._currentFilters['vegeterian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters(
                {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegeterian': _isVegetarian,
                },
              );
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: (Text(
              'Adjust your meal selection...',
              style: Theme.of(context).textTheme.title,
            )),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Glutane Free',
                  'Include only Glutane Free meals',
                  _isGlutenFree,
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Include only Vegan meals',
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Include only Vegetarian meals',
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Include only Lactose Free meals',
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
