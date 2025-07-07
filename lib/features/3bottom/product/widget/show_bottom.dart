import 'package:flutter/material.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip('Interior', true),
                _buildFilterChip('Exterior', false),
                _buildFilterChip('Waterproofing', false),
                _buildFilterChip('Woodfinish', false),
                _buildFilterChip('Wallpaper', false),
                _buildFilterChip('Enamel', false),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip('1000', true),
                _buildFilterChip('3000', false),
                _buildFilterChip('5000', false),
                _buildFilterChip('8000', false),
                _buildFilterChip('12,000', false),
                _buildFilterChip('15,000', false),
                _buildFilterChip('20,000', false),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: Text("Clean")),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Apply Changes"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildFilterChip(String label, bool isSelected) {
  return FilterChip(
    label: Text(label),
    selected: isSelected,
    selectedColor: Colors.black,
    backgroundColor: Colors.grey[200],
    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    onSelected: (bool value) {},
  );
}
