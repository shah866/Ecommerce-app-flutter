import 'package:ecommerce_app/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';


class CategoryDropdown extends StatefulWidget {
  final List<CategoryEntity> categories;
  final int? initialCategoryId;
  final ValueChanged<int>? onChanged;

  const CategoryDropdown({
    super.key,
    required this.categories,
    this.initialCategoryId,
    this.onChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  int? _currentId;

  void _onChanged(int? val) {
    setState(() => _currentId = val);
    if (val != null) widget.onChanged?.call(val);
  }

  @override
  void initState() {
    super.initState();
    _currentId = widget.initialCategoryId;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: const InputDecoration(labelText: 'Category'),
      value: _currentId,
      items:
          widget.categories
              .map(
                (cat) => DropdownMenuItem(value: cat.id, child: Text(cat.name)),
              )
              .toList(),
      onChanged: _onChanged,
      validator: (val) => val == null ? 'Select a category' : null,
    );
  }
}
