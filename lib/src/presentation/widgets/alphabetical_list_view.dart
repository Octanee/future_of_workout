import 'package:flutter/material.dart';

class AlphabeticalListView<T> extends StatelessWidget {
  const AlphabeticalListView({
    required this.data,
    required this.itemBuilder,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 16.0,
    this.childAspectRatio = 1,
    this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
    super.key,
  });

  final List<TaggedItem<T>> data;
  final Widget Function(BuildContext, int) itemBuilder;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return Container();

    data.sort((a, b) => a.tag.compareTo(b.tag));

    return GridView.builder(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

class TaggedItem<T> {
  TaggedItem({required this.item, required this.tag});

  final T item;
  final String tag;

  @override
  String toString() {
    return 'TaggedItem [ $item, tag: $tag]';
  }
}
