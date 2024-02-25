import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_gaming_task/models/contest.dart';
import 'package:gods_gaming_task/ui/team_selection.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset('assets/Contest.png'),
          const Column(
            children: [
              _TopSection(),
              SizedBox(height: 24),
              _FilterButtons(),
              SizedBox(height: 10),
              _ContestList(),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatefulWidget {
  const _TopSection();

  @override
  State<_TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<_TopSection> {
  bool _isExpanded = false;
  final String _initText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.06),
            Colors.white.withOpacity(0.04),
          ],
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 4),
              IconButton(
                icon: const Row(
                  children: [
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
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 14),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/image 19.png',
                      height: 15,
                    ),
                    const Spacer(),
                    const Text(
                      'Today 09:00 PM',
                      style: TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lorem Ipsum is simply',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Type : Lorem Ipsum',
                  style: TextStyle(
                    color: Color(0xffA4A4A4),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                StatefulBuilder(
                  builder: (context, setState) {
                    return RichText(
                      text: TextSpan(
                        text: _initText.substring(
                          0,
                          _isExpanded
                              ? _initText.length
                              : (_initText.length / 2).ceil().toInt(),
                        ),
                        style: const TextStyle(
                          color: Color(0xffA4A4A4),
                          height: 1.6,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: _isExpanded ? ' Show less' : ' Read more',
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.6,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(() {
                                    _isExpanded = !_isExpanded;
                                  }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButtons extends StatefulWidget {
  const _FilterButtons();

  @override
  State<_FilterButtons> createState() => __FilterButtonsState();
}

class __FilterButtonsState extends State<_FilterButtons> {
  int activeIndex = 0;
  List<String> buttons = ['CONTEST', 'MY CONTEST', 'MY TEAMS'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 22),
        ...buttons.map(
          (e) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                activeIndex = buttons.indexOf(e);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                gradient: activeIndex == buttons.indexOf(e)
                    ? const LinearGradient(
                        colors: [
                          Color(0xffEC742F),
                          Color(0xffEA4B27),
                        ],
                      )
                    : null,
                border: Border.all(
                  color: activeIndex == buttons.indexOf(e)
                      ? Colors.white
                      : const Color(0xffFF6F31),
                  width: activeIndex != buttons.indexOf(e) ? 1 : 0.2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                e,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Bungee',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContestList extends StatefulWidget {
  const _ContestList();

  @override
  State<_ContestList> createState() => __ContestListState();
}

class __ContestListState extends State<_ContestList> {
  List<ContestSchema> contestList = [
    ContestSchema(
      teamName: 'Team 1',
      id: '12321',
      fillingFast: true,
      entryFee: 60,
      discountedEntryFee: 50,
      totalPrize: '₹1.50 Lakhs',
      firstPrize: 8000,
      winnerCount: 100,
      maxPermittedSpots: 20,
      type: 'Flexible',
      rewardType: 'Confirmed',
      totalSpots: 500,
      availableSpots: 208,
    ),
    ContestSchema(
      teamName: 'Team 2',
      id: '56525',
      fillingFast: false,
      entryFee: 160,
      discountedEntryFee: 120,
      totalPrize: '₹1.50 Lakhs',
      firstPrize: 8000,
      winnerCount: 100,
      maxPermittedSpots: 20,
      type: 'Flexible',
      rewardType: 'Confirmed',
      totalSpots: 500,
      availableSpots: 470,
    ),
    ContestSchema(
      teamName: 'Team 3',
      id: '67453',
      fillingFast: false,
      entryFee: 60,
      discountedEntryFee: 50,
      totalPrize: '₹2.50 Lakhs',
      firstPrize: 10000,
      winnerCount: 100,
      maxPermittedSpots: 20,
      type: 'Flexible',
      rewardType: 'Confirmed',
      totalSpots: 500,
      availableSpots: 300,
    ),
    ContestSchema(
      teamName: 'Team 4',
      id: '23346',
      fillingFast: true,
      entryFee: 260,
      discountedEntryFee: 230,
      totalPrize: '₹10000',
      firstPrize: 600,
      winnerCount: 100,
      maxPermittedSpots: 3,
      type: 'Flexible',
      rewardType: 'Confirmed',
      totalSpots: 500,
      availableSpots: 69,
    ),
    ContestSchema(
      teamName: 'Team 5',
      id: '34524',
      fillingFast: false,
      entryFee: 130,
      discountedEntryFee: 150,
      totalPrize: '₹15000',
      firstPrize: 500,
      winnerCount: 100,
      maxPermittedSpots: 20,
      type: 'Flexible',
      rewardType: 'Confirmed',
      totalSpots: 500,
      availableSpots: 60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            for (ContestSchema e in contestList)
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TeamSelection(teamName: e.teamName),
                    ),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.5),
                      // top: contestList.indexOf(e) != 1 ? 9 : 18,
                      child: Container(
                        // margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Rectangle 186.png'),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Prize Pool',
                                      style: TextStyle(
                                        color: Color(0xffA4A4A4),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      e.totalPrize,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                        bottom: 7,
                                        top: 2,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      width: 90,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xffEC742F),
                                            Color(0xffEA4B27),
                                          ],
                                        ),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        '₹ ${e.discountedEntryFee}',
                                        style: const TextStyle(
                                          fontFamily: 'Bungee',
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Entry fee : ',
                                            style: TextStyle(
                                              color: Color(0xffA4A4A4),
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '₹ ${e.entryFee}',
                                            style: const TextStyle(
                                              color: Color(0xffA4A4A4),
                                              fontSize: 10,
                                              decorationColor:
                                                  Color(0xffA4A4A4),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                _ContestBadge(
                                  icon: 'assets/trophy-star 1.svg',
                                  text: '1st ₹${e.firstPrize}',
                                ),
                                _ContestBadge(
                                  icon: 'assets/gold-medal (1) 1.svg',
                                  text: '${e.winnerCount} Winners',
                                ),
                                _ContestBadge(
                                  icon: 'assets/ticket 1.svg',
                                  text: '${e.maxPermittedSpots} Entries',
                                ),
                                _ContestBadge(
                                  icon: 'assets/dice 2.svg',
                                  text: e.type,
                                ),
                                _ContestBadge(
                                  icon: 'assets/dice 2.svg',
                                  text: e.rewardType,
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            LinearProgressIndicator(
                              minHeight: 3,
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xffEA4B27),
                              backgroundColor: Colors.white,
                              value: (e.totalSpots - e.availableSpots) /
                                  e.totalSpots,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${e.totalSpots} Spots',
                                  style: const TextStyle(
                                    color: Color(0xffF8F8F8),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '${e.availableSpots} Spots Left',
                                  style: const TextStyle(
                                    color: Color(0xffF8F8F8),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    if (e.fillingFast)
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffEC742F),
                              Color(0xffEA4B27),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          'Filling Fast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _ContestBadge extends StatelessWidget {
  const _ContestBadge({
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xffF8F8F8),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
