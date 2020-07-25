import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitches(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        subtitle,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
        title: Text('Your Filters.'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal Prefrences',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: Card(
              child: ListView(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                    ),
                    elevation: 10,
                    child: _buildSwitches(
                      'Gluten_free',
                      'Only include gluten-free meals.',
                      _glutenFree,
                      (newValue) {
                        setState(
                          () {
                            _glutenFree = newValue;
                          },
                        );
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                    ),
                    elevation: 10,
                    child: _buildSwitches(
                      'Lactose-Free',
                      'Only include Lactose-free meals.',
                      _lactoseFree,
                      (newValue) {
                        setState(
                          () {
                            _lactoseFree = newValue;
                          },
                        );
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                    ),
                    elevation: 10,
                    child: _buildSwitches(
                      'Vegetarian',
                      'Only include Vegetarian meals.',
                      _vegetarian,
                      (newValue) {
                        setState(
                          () {
                            _vegetarian = newValue;
                          },
                        );
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                    ),
                    elevation: 10,
                    child: _buildSwitches(
                      'Vegan',
                      'Only include Vegan meals.',
                      _vegan,
                      (newValue) {
                        setState(
                          () {
                            _vegan = newValue;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
