import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:star_wars/providers/star_wars.provider.dart';
import 'package:star_wars/screens/character_screen.screen.dart';
import 'package:star_wars/screens/message_error.screen.dart';
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
  bool loading = false;
  bool initFetchError = false;
  @override
  void initState() {
    _initFetch();

    super.initState();
  }

  /// Función inicial para traer la información inicial.(Los primeros personajes).
  Future<void> _initFetch() async {
    try {
      setState(() {
        loading = true;
      });
      await providerRead.getPeople();
      setState(() {
        loading = false;
        initFetchError = false;
      });
    } catch (e) {
      setState(() {
        initFetchError = true;
      });
    }
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
    } catch (e) {
      Navigator.pushNamed(context, MessageErrorScreen.routeName);
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  bool status5 = false;

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
        drawer: const DrawerWidget(),
        body: (!loading)
            ? (!initFetchError)
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 24, top: 5),
                    child: Column(
                      children: [
                        Expanded(
                          child: SmartRefresher(
                            physics: const BouncingScrollPhysics(),
                            enablePullUp: (providerWatch.people!.next != null)
                                ? true
                                : false,
                            enablePullDown: false,
                            controller: _refreshController,
                            onLoading: (providerWatch.people!.next != null)
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
                              itemCount: context
                                  .watch<StarWarsProvider>()
                                  .persons
                                  .length,
                              itemBuilder: ((context, index) => GestureDetector(
                                    onTap: () {
                                      /// Limpiamos los array del estado
                                      providerRead.clearArray();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CharacterScreen(
                                            person: context
                                                .watch<StarWarsProvider>()
                                                .persons[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: HomeScreenPersonItemWidget(
                                      person: context
                                          .watch<StarWarsProvider>()
                                          .persons[index],
                                    ),
                                  )),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                height: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : _InitFechErrorMessageWidget(
                    initFetch: _initFetch,
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class _InitFechErrorMessageWidget extends StatelessWidget {
  final VoidCallback _initFetch;
  const _InitFechErrorMessageWidget({
    required final VoidCallback initFetch,
  }) : _initFetch = initFetch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(24),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomStylesTheme.gray100Color,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(
            width: 1.5,
            color: CustomStylesTheme.gray200Color,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Se produjo un al intentar cargar la información.',
              textAlign: TextAlign.center,
              style: CustomStylesTheme.titleM20_24_semibold.copyWith(
                  fontFamily: CustomStylesTheme.fontFamilyAlliance2,
                  color: CustomStylesTheme.secondaryRed500Color),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlineButtonWidget(
              text: 'Reintentar',
              submitFunction: () => _initFetch(),
            ),
          ],
        ),
      ),
    );
  }
}
