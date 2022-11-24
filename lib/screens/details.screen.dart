import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO Movie Instance

    final String movie =
      ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAddBar(),
        ],
      ),
    );
  }
}

class _CustomAddBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Movie Title',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: AssetImage('assets/images/500x300.png'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}
