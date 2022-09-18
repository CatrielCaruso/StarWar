import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/screens/details_person_screen.screen.dart';
import 'package:star_wars/themes/themes.themes.dart';
import 'package:star_wars/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final StarWarsProvider providerRead = context.read<StarWarsProvider>();
  late final StarWarsProvider providerWatch = context.watch<StarWarsProvider>();
  late final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    _initFetch();

    super.initState();
  }

  /// Función inicial para traer la información inicial.(Los primeros personajes).
  Future<void> _initFetch() async {
    try {
      await providerRead.getPeople();
    } catch (e) {}
  }

  /// Esta función ira actualizando la lista de personajes
  /// con nuevos persona que irá trayendo desde la api.
  void _onLoading() async {
    try {
      providerRead.pageIncrement();
      await providerRead.getPeople();
      // if failed,use loadFailed(),if no data return,use LoadNodata()

      if (mounted) setState(() {});
      _refreshController.loadComplete();
    } catch (e) {}
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomStylesTheme.blueLightColor,
          title: const Text(
            'Personajes',
            style: CustomStylesTheme.titleL24_28_semibold,
          ),
          centerTitle: true,
        ),
        body: (context.watch<StarWarsProvider>().finishedFetch)
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 24, top: 5),
                child: Column(
                  children: [
                    Expanded(
                      child: SmartRefresher(
                        physics: const BouncingScrollPhysics(),
                        enablePullUp:
                            (providerWatch.people.next != null) ? true : false,
                        enablePullDown: false,
                        controller: _refreshController,
                        onLoading: (providerWatch.people.next != null)
                            ? _onLoading
                            : null,
                        footer: const ClassicFooter(
                          idleText: '',
                          idleIcon: null,
                          canLoadingText: '',
                          loadStyle: LoadStyle.ShowWhenLoading,
                        ),
                        child: ListView.separated(
                          // controller: scrollController,
                          itemCount:
                              context.watch<StarWarsProvider>().persons.length,
                          itemBuilder: ((context, index) => GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPersonScreen(
                                      person: context
                                          .watch<StarWarsProvider>()
                                          .persons[index],
                                    ),
                                  ),
                                ),
                                child: HomeScreenPersonItemWidget(
                                  person: context
                                      .watch<StarWarsProvider>()
                                      .persons[index],
                                ),
                              )),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
