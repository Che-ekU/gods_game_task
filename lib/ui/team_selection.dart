import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_gaming_task/models/player.dart';

class TeamSelection extends StatelessWidget {
  const TeamSelection({
    super.key,
    required this.teamName,
  });

  final String teamName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.04),
        leading: IconButton(
          icon: const Row(
            children: [
              SizedBox(width: 4),
              Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(width: 4),
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 16),
          child: SizedBox(),
        ),
        leadingWidth: 100,
        centerTitle: true,
        title: Text(
          teamName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/Frame 1321317485.png'),
          const Column(
            children: [
              SizedBox(height: 100),
              _TopSection(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: _Players(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '11/11',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Players',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'ENG',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '7 : 4',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xff353535),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'IRL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '20',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Credit left',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Players extends StatefulWidget {
  const _Players();

  @override
  State<_Players> createState() => _PlayersState();
}

class _PlayersState extends State<_Players> {
  final List<PlayerSchema> players = [
    PlayerSchema(
      name: 'sdgnbfgbfdb',
      id: '123',
      skill: 'Fast bowler',
      role: "Captain",
      isForeigner: true,
    ),
    PlayerSchema(
      name: 'dgnb eyhytgfnb',
      id: '324',
      skill: 'Batsman',
      role: "Vice Captain",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'rdgfbv eefdxcv',
      id: '565',
      skill: 'WK',
      role: "Player",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'regf ergrtfd',
      id: '123',
      skill: 'Fast bowler',
      role: "Player",
      isForeigner: true,
    ),
    PlayerSchema(
      name: 'nbsdf tfgbyhmn',
      id: '678',
      skill: 'Batsman',
      role: "Player",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'thgnbvdfcx ergf',
      id: '455',
      skill: 'Allrounder',
      role: "Player",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'bvngfg efg',
      id: '845',
      skill: 'Spinner',
      role: "Player",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'mynghjmu ukiu',
      id: '976',
      skill: 'Spinner',
      role: "Player",
      isForeigner: true,
    ),
    PlayerSchema(
      name: 'jhjhcer esd',
      id: '862',
      skill: 'Spinner',
      role: "Player",
      isForeigner: false,
    ),
    PlayerSchema(
      name: 'ouijhntfg es',
      id: '954',
      skill: 'Spinner',
      role: "Player",
      isForeigner: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...players
                .where((element) =>
                    ['Captain', 'Vice Captain'].contains(element.role))
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/Group 477 (1).png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 1.5),
                              child: Image.asset('assets/Group 27225.png'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 58.0, top: 5),
                              child: e.skill == 'Bowler'
                                  ? SvgPicture.asset(
                                      'assets/bowler.svg',
                                    )
                                  : e.skill == 'WK'
                                      ? SvgPicture.asset(
                                          'assets/wk.svg',
                                          height: 16,
                                        )
                                      : e.skill == 'Spinner'
                                          ? SvgPicture.asset(
                                              'assets/spinner.svg',
                                              height: 16,
                                            )
                                          : e.skill == 'Batsman'
                                              ? SvgPicture.asset(
                                                  'assets/batsman.svg',
                                                  height: 17,
                                                )
                                              : SvgPicture.asset(
                                                  'assets/allrounder.svg',
                                                  height: 16,
                                                ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 120, left: 30),
                              height: 24.5,
                              width: 24.5,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffEC742F),
                                    Color(0xffEA4B27),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                e.role == 'Captain' ? 'C' : 'VC',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.5,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          constraints: const BoxConstraints(minWidth: 60),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Text(
                            e.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...players.sublist(1, 4).map(
                  (e) => _PlayerElement(e: e),
                ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...players.sublist(4, 6).map((e) => _PlayerElement(e: e)),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...players.sublist(6, 10).map((e) => _PlayerElement(e: e)),
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _PlayerElement extends StatelessWidget {
  const _PlayerElement({
    required this.e,
  });
  final PlayerSchema e;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.scale(
          scale: 0.85,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Stack(
              children: [
                Image.asset('assets/Group 477 (1).png'),
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Image.asset('assets/Group 27225.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // left: e.skill == 'Batsman' ? 56 : 58.0,
                    left: 56,
                    top: 5,
                  ),
                  child: Transform.scale(
                    scale: 1.17,
                    child: e.skill == 'Bowler'
                        ? SvgPicture.asset(
                            'assets/bowler.svg',
                          )
                        : e.skill == 'WK'
                            ? SvgPicture.asset(
                                'assets/wk.svg',
                              )
                            : e.skill == 'Spinner'
                                ? SvgPicture.asset(
                                    'assets/spinner.svg',
                                    height: 16,
                                  )
                                : e.skill == 'Batsman'
                                    ? SvgPicture.asset(
                                        'assets/batsman.svg',
                                        height: 17,
                                      )
                                    : SvgPicture.asset(
                                        'assets/allrounder.svg',
                                        height: 16,
                                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 60,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: !e.isForeigner ? Colors.white : Colors.black,
          ),
          child: Text(
            e.name.toUpperCase(),
            style: TextStyle(
              fontSize: 8,
              color: e.isForeigner ? Colors.white : Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
