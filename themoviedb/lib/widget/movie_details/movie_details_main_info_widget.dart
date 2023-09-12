import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widget/elements/radial_percent_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(25.0),
          child: _MovieNameWidget(),
        ),
        _SummaryWidget(),
        _ScoreWidget(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _DEscriptionWidget(),
        ),
        SizedBox(
          height: 30,
        ),
        _PeopleWidget(),
      ],
    );
  }
}

class _DEscriptionWidget extends StatelessWidget {
  const _DEscriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Богиня войны Афина перерождается в теле молодой женщины. А в это время парень-сирота по имени Сэя узнает, что должен стать рыцарем Богини и защищать мир от неведомой угрозы.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(
          image: AssetImage(AppImages.topHeader),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(AppImages.topHeaderSubImage),
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(children: [
        TextSpan(
          text: "Tom CLancy's Without Remorse ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        TextSpan(
          text: " (2021)",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: RadialPrecentWidget(
                  child: Text('72'),
                  percent: 0.72,
                  fillColor: Color.fromARGB(255, 10, 23, 25),
                  lineColor: Color.fromARGB(255, 37, 203, 103),
                  freeColor: Color.fromARGB(255, 25, 54, 31),
                  lineWidth: 3,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('User Score'),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          width: 1,
          height: 15,
        ),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.play_arrow),
              Text('Play Trayler'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'R, 04/29/2021  (US) 1h 49m  Action, Adventure, Thriller, War',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          maxLines: 3,
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    final jobTitleStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matthew Stuecken',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matthew Stuecken',
                  style: nameStyle,
                ),
                Text(
                  'Screenplay',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matthew Stuecken',
                  style: nameStyle,
                ),
                Text(
                  'Screenplay',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matthew Stuecken',
                  style: nameStyle,
                ),
                Text(
                  'Screenplay',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
