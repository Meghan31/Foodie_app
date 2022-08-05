import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTiles(
    String title,
    String description,
    var currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushNamed('/');
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              // 1
              _buildSwitchListTiles(
                'Gluten-free',
                'includes Gluteen free meals',
                _glutenFree,
                (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                },
              ),
              // 2
              _buildSwitchListTiles(
                'Lactose-free',
                'includes Lactose free meals',
                _lactoseFree,
                (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                },
              ),
              // 3
              _buildSwitchListTiles(
                'Vegetarian',
                'includes Vegetarian meals',
                _vegetarian,
                (value) {
                  setState(
                    () {
                      _vegetarian = value;
                    },
                  );
                },
              ),
              // 4
              _buildSwitchListTiles(
                'Vegan',
                'includes Vegan meals',
                _vegan,
                (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
