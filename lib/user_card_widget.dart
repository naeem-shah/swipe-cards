import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'border_painter.dart';

class UserCard extends StatefulWidget {
  final Function? onLike;

  const UserCard({Key? key, this.onLike}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 44,
              width: size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkTheme
                            ? const Color(0xff34373b)
                            : const Color(0xffADB7C4),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          widget.onLike?.call();
                        },
                        child: SvgPicture.asset(
                          "images/heart.svg",
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Joined May 2020",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BorderPainter(),
                child: Image.asset(
                  'images/person.png',
                  width: 200,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "09",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Todd",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkTheme
                        ? const Color(0xff34373b)
                        : const Color(0xffADB7C4),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.open_in_full,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
