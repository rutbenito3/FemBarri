import 'package:flutter/material.dart';

class Review extends StatefulWidget {

  final int maximumRating;
  final Function(int) onRatingSelected;

  Review(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Review createState() => _Review(); 

}

class _Review extends State<Review> {

  Widget _buildRatingStar(int index) {
    return Icon(Icons.star_border_outlined);
  }

  Widget _buildBody() {

    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          print(index);
        }
      );
    });

    return Row(children: stars, mainAxisAlignment: MainAxisAlignment.center);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}