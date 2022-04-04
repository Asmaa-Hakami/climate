import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'routes/ router.gr.dart';

class NavigationBarBottom extends StatelessWidget {
  const NavigationBarBottom({Key? key}) : super(key: key); //this.index

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        SeasonsRouter(),
        ZodiacsRouter(),
        MonthsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: Material(
                elevation: 15,
                child: SalomonBottomBar(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  currentIndex: 5,
                  onTap: (int index) {
                    tabsRouter.setActiveIndex(index);
                    tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
                  },
                  items: [
                    SalomonBottomBarItem(
                      icon: Column(
                        children: [
                          Image.asset(
                            'assets/icons/home.png',
                            height: 25,
                          ),
                          const Text(
                            'الرئيسية',
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.5,
                                color: Color(0xff3A6978)),
                          ),
                          if (tabsRouter.activeIndex == 0 &&
                              !tabsRouter.canPopSelfOrChildren)
                            const Image(
                              image: AssetImage('assets/icons/nav_circle.png'),
                              height: 10,
                            ),
                        ],
                      ),
                      title: const Text(''),
                    ),
                    SalomonBottomBarItem(
                      icon: Column(
                        children: [
                          Image.asset(
                            'assets/icons/seasons.png',
                            height: 25,
                          ),
                          const Text(
                            'الفصول',
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.5,
                                color: Color(0xff3A6978)),
                          ),
                          if (tabsRouter.activeIndex == 1 &&
                              !tabsRouter.canPopSelfOrChildren)
                            const Image(
                              image: AssetImage('assets/icons/nav_circle.png'),
                              height: 10,
                            ),
                        ],
                      ),
                      title: const Text(''),
                    ),
                    SalomonBottomBarItem(
                      icon: Column(
                        children: [
                          Image.asset(
                            'assets/icons/zodiac.png',
                            height: 25,
                          ),
                          const Text(
                            'المواسم',
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.5,
                                color: Color(0xff3A6978)),
                          ),
                          if (tabsRouter.activeIndex == 2 &&
                              !tabsRouter.canPopSelfOrChildren)
                            const Image(
                              image: AssetImage('assets/icons/nav_circle.png'),
                              height: 10,
                            ),
                        ],
                      ),
                      title: const Text(''),
                    ),
                    SalomonBottomBarItem(
                      icon: Column(
                        children: [
                          Image.asset(
                            'assets/icons/months.png',
                            height: 25,
                          ),
                          const Text(
                            'الأشهر',
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.5,
                                color: Color(0xff3A6978)),
                          ),
                          if (tabsRouter.activeIndex == 3 &&
                              !tabsRouter.canPopSelfOrChildren)
                            const Image(
                              image: AssetImage('assets/icons/nav_circle.png'),
                              height: 10,
                            ),
                        ],
                      ),
                      title: const Text(''),
                    ),
                  ],
                )));
      },
    );
  }
}
