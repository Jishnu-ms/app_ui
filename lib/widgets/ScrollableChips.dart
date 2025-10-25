import 'package:flutter/material.dart';

class ScrollableChips extends StatefulWidget {
  final List<String> chips; // list of chip labels
  final Function(int)? onChipSelected; // optional callback for selection

  const ScrollableChips({super.key, required this.chips, this.onChipSelected});

  @override
  State<ScrollableChips> createState() => _ScrollableChipsState();
}

class _ScrollableChipsState extends State<ScrollableChips> {
  int selectedIndex = -1; // -1 = no chip selected

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(
            widget.chips.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  if (widget.onChipSelected != null) {
                    widget.onChipSelected!(index); // callback
                  }
                },
                child: Container(
                  height: 45,
                  width: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.grey[700] // dark grey when selected
                        : Colors.white, // light grey when unselected
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.chips[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
