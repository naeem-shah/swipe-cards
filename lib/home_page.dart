import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import 'user_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    if (isDarkTheme) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
      ));
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
      ));
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ));
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isDarkTheme
                    ? "images/background_dark.png"
                    : "images/background_light.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 24,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26, left: 26, right: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meet our Brains",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          "images/search.svg",
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SwipeableCardsSection(
                  cardController: _cardController,
                  context: context,
                  items: [
                    for (int i = 0; i < 3; i++)
                      UserCard(
                        onLike: () {
                          _cardController.triggerSwipeRight();
                        },
                      ),
                  ],
                  // cardWidthBottomMul: 0.8,
                  // cardWidthMiddleMul: 0.85,
                  // cardWidthTopMul: 1,
                  // cardHeightBottomMul: .5,
                  // cardHeightMiddleMul: .55,
                  // cardHeightTopMul: .6,
                  //Get card swipe event callbacks
                  onCardSwiped: (dir, index, widget) {
                    //Add the next card using _cardController
                    _cardController.addItem(UserCard(
                      onLike: () {
                        _cardController.triggerSwipeRight();
                      },
                    ));

                    //Take action on the swiped widget based on the direction of swipe
                    //Return false to not animate cards
                  },
                  //
                  enableSwipeUp: false,
                  enableSwipeDown: false,
                ),

                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.swipe,
                      color: Color(0xffB6B6B6),
                      size: 30,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Swipe right or left to like".toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xffB6B6B6),
                            fontWeight: FontWeight.w300,
                          ),
                    )
                  ],
                ),
                // other children
              ],
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }

  Widget get bottomNavigationBar => ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: Container(
          color: Theme.of(context).cardTheme.color,
          padding: const EdgeInsets.only(
            left: 26,
            right: 26,
            top: 16,
            bottom: 34,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/girl.png",
                height: 26,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF9A61A),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: const Text("BOOK NOW"),
              ),
              SvgPicture.asset(
                "images/Album.svg",
                height: 25,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              )
            ],
          ),
        ),
      );
}
