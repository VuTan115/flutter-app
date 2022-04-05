import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goob_by_me/app/components/app_drawer/app_drawer.dart';
import 'package:goob_by_me/app/localizations/localizations.dart';
import 'package:goob_by_me/app/pages/delivery/delivery_route.dart';
import 'package:goob_by_me/app/pages/home/home_route.dart';
import 'package:goob_by_me/app/pages/payment/payment_route.dart';
import 'package:goob_by_me/app/pages/place/place_route.dart';
import 'package:goob_by_me/app/pages/trade/trade_route.dart';
import 'package:goob_by_me/app/pages/transport/transport_route.dart';
import 'package:goob_by_me/app/pages/user/user_route.dart';
import 'package:goob_by_me/app/themes/default_theme.dart';
import 'package:goob_by_me/app/utils/assets.dart';
import 'package:goob_by_me/app/utils/media.dart';
import 'package:goob_by_me/core/utils/configuration.dart';
import 'package:goob_by_me/domain/blocs/application/application_bloc.dart';
import 'package:goob_by_me/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:goob_by_me/domain/blocs/pages/main_page/main_page_bloc.dart';
import 'package:goob_by_me/domain/models/app_settings.model.dart';
import 'package:goob_by_me/domain/models/models.dart';
import 'package:goob_by_me/domain/models/principal.model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goob_by_me/app/utils/variables.dart';
import 'package:goob_by_me/domain/repositories/main_page_repository.dart';

class MainPage extends StatefulWidget {
  final Map<String, Object>? arguments;

  MainPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late Media _media;
  late double _mediaRatio;

  late AppSettings _settings;
  late Principal _principal;

  late PageController _pageController;
  late Animation<double> _barAnimation;
  late AnimationController _animController;

  late List<MainView> mainViews;
  late MainView _currentView;
  late List<String> _viewTracking;

  late bool _willPop;
  late ScrollDirection _scrollTick;

  late bool _isMainView;

  @override
  void initState() {
    print("Main Page set state");

    // _settings = AppSettings.def();
    // _principal = Principal.def();

    if (widget.arguments != null && widget.arguments!['settings'] != null) {
      _settings = widget.arguments!['settings'] as AppSettings;
    } else {
      ApplicationState applicationState = context.read<ApplicationBloc>().state;
      if (applicationState is ApplicationLoadSuccess) {
        _settings = applicationState.settings;
      }
    }

    if (widget.arguments != null && widget.arguments!['principal'] != null) {
      _principal = widget.arguments!['principal'] as Principal;
    } else {
      AuthenticationState authenticationState = context.read<AuthenticationBloc>().state;
      if (authenticationState is AuthenticationLoadSuccess) {
        _principal = authenticationState.principal;
      }
    }
    _pageController = PageController();
    _animController = AnimationController(vsync: this, duration: defaultDuration);
    _barAnimation = Tween(begin: 0.0, end: kToolbarHeight).animate(_animController);
    _barAnimation.addListener(() {
      // setState(() {});
    });

    mainViews = <MainView>[
      MainView(
        'home',
        'Gobid',
        'main',
        HomeRoute(callback: _handleCallback),
        icon: Icons.home,
        color: homeColor,
      ),
      MainView(
        'transport',
        'Transport',
        'main',
        TransportRoute(callback: _handleCallback),
        icon: Icons.local_taxi,
        color: transportColor,
      ),
      MainView(
        'trade',
        'Trade',
        'main',
        TradeRoute(callback: _handleCallback),
        icon: Icons.store,
        color: tradeColor,
      ),
      MainView(
        'place',
        'Place',
        'main',
        PlaceRoute(callback: _handleCallback),
        icon: Icons.pin_drop,
        color: placeColor,
      ),
      MainView(
        'delivery',
        'Delivery',
        'main',
        DeliveryRoute(callback: _handleCallback),
        icon: Icons.airport_shuttle,
        color: deliveryColor,
      ),
      MainView(
        'payment',
        'Payment',
        'main',
        PaymentRoute(callback: _handleCallback),
        icon: Icons.payment,
        color: paymentColor,
      ),
      MainView(
          'user',
          'User',
          'main',
          UserRoute(
            callback: _handleCallback,
          ),
          icon: Icons.account_circle,
          color: userColor),
    ];

    _currentView = mainViews[0];
    _viewTracking = <String>[_currentView.key!];

    _willPop = false;
    _scrollTick = ScrollDirection.idle;
    // _handleShowBars();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild MainPage');

    _media = Media(context);
    _mediaRatio = _media.ratio;
    _isMainView = _currentView.view == 'main';

    final MainPageRepository mainPageRepository = MainPageRepository();

    return NotificationListener<UserScrollNotification>(
      onNotification: _handleNotification,
      child: RepositoryProvider.value(
        value: mainPageRepository,
        child: BlocProvider(
          create: (_) => MainPageBloc(
            mainPageRepository: mainPageRepository,
          ),
          child: Scaffold(
            key: GlobalKeys.mainScaffold,
            appBar: _buildAppBar(),
            body: _buildBody(),
            drawer: _buildDrawer(),
            bottomNavigationBar: _buildNavBar(),
          ),
        ),
      ),
    );
  }

  //build AppBar
  Widget _buildLeading() {
    if (_isMainView) {
      return IconButton(
        icon: Icon(Icons.menu, size: _mediaRatio * 26),
        onPressed: () => _handleOpenDrawer(),
      );
    } else {
      return IconButton(
        icon: Icon(Icons.arrow_back, size: _mediaRatio * 26),
        onPressed: () => _handleWillPop(),
      );
    }
  }

  Widget _buildTitle() {
    final FocusScopeNode focusScopeNode = FocusScopeNode();

    String searchHintText = 'Search...';

    switch (_currentView.key) {
      case 'home':
        searchHintText = 'Search on Gobid...';
        break;
      case 'transport':
        searchHintText = 'Search on Transport...';
        break;
      case 'trade':
        searchHintText = 'Search on Trade...';
        break;
      case 'place':
        searchHintText = 'Search on Place...';
        break;
      case 'delivery':
        searchHintText = 'Search on Delivery...';
        break;
      case 'payment':
        searchHintText = 'Search on Payment...';
        break;
      case 'user':
        searchHintText = 'Search on User...';
        break;
    }

    if (_currentView.view == 'search') {
      return Container(
        alignment: Alignment.centerLeft,
        height: _mediaRatio * 36,
        //color: Colors.white,
        child: FocusScope(
          node: focusScopeNode,
          child: TextField(
            autofocus: true,
            style: TextStyle(fontSize: _mediaRatio * 16, color: Colors.black87),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(width: 0.3, color: _currentView.color!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                borderSide: BorderSide(width: 0.3, color: Colors.black87),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: _mediaRatio * 10),
              hintText: searchHintText,
              suffixIcon: Icon(Icons.search, color: _currentView.color),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => _handleOpenSearch(),
        child: Container(
          alignment: Alignment.centerLeft,
          height: _mediaRatio * 36,
          child: Padding(
            padding: EdgeInsets.only(left: _mediaRatio * 5),
            child: Text(_currentView.title.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: _mediaRatio * 20)),
          ),
        ),
      );
    }
  }

  PreferredSize? _buildAppBar() {
    // print("build appbar");
    return PreferredSize(
      child: SizeTransition(
        sizeFactor: _animController,
        child: AppBar(
          leading: _buildLeading(),
          title: _buildTitle(),
          titleSpacing: 0.0,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: _currentView.color,
          brightness: Brightness.dark,
          actions: <Widget>[
            (_currentView.view == 'search')
                ? SizedBox.shrink()
                : IconButton(
                    icon: Icon(Icons.search, color: Colors.white70, size: _mediaRatio * 26),
                    onPressed: () => _handleOpenSearch(),
                  ),
            IconButton(
              icon: Icon(Icons.notifications_none,
                  color: _currentView.view == 'notification' ? Colors.white : Colors.white70,
                  size: _mediaRatio * 26),
              onPressed: () => _handleOpenNotification(),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(_barAnimation.value),
    );
  }

  //build Drawer
  Widget _buildDrawer() {
    return AppDrawer();
  }

  //Build Body
  Widget _buildBody() {
    return WillPopScope(
      onWillPop: _handleWillPop,
      child: SafeArea(
        top: false,
        child: PageView(
          controller: _pageController,
          onPageChanged: _handlePageChanged,
          children: mainViews.map((MainView mainView) {
            return mainView.widget;
          }).toList(),
          physics: NeverScrollableScrollPhysics(), // No sliding
        ),
      ),
    );
  }

  // build NavBar
  Widget _buildNavBar() {
    return SizeTransition(
      sizeFactor: _animController,
      // axisAlignment: -1.0,
      child: Container(
        child: BottomNavigationBar(
          currentIndex: mainViews.indexOf(_currentView),
          selectedItemColor: _currentView.color,
          selectedLabelStyle: TextStyle(fontSize: _mediaRatio * 14, fontWeight: FontWeight.w500),
          unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.75),
          unselectedLabelStyle: TextStyle(fontSize: _mediaRatio * 14, fontWeight: FontWeight.w400),
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(LightIcons.home, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              activeIcon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(SolidIcons.home, color: Color.fromRGBO(70, 120, 150, 1.0)),
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(LightIcons.carBus, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              activeIcon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(SolidIcons.carBus, color: Color.fromRGBO(0, 140, 220, 1.0)),
              ),
              label: 'Di chuyển',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child:
                    SvgPicture.asset(LightIcons.bagsShopping, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              activeIcon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(SolidIcons.bagsShopping,
                    color: Color.fromRGBO(240, 170, 0, 1.0)),
              ),
              label: 'Mua bán',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child:
                    SvgPicture.asset(LightIcons.mapMarkedAlt, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              activeIcon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(SolidIcons.mapMarkedAlt,
                    color: Color.fromRGBO(0, 150, 136, 1.0)),
              ),
              label: 'Địa điểm',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(LightIcons.userCircle, color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              activeIcon: SizedBox(
                width: _mediaRatio * 24,
                height: _mediaRatio * 24,
                child: SvgPicture.asset(SolidIcons.userCircle,
                    color: Color.fromRGBO(70, 120, 150, 1.0)),
              ),
              label: 'Cá nhân',
            ),
          ],
          onTap: (index) {
            _handleBarItemTap(index);
          },
        ),
      ),
    );
  }

  // handle function
  void _handleOpenSearch() {
    if (_currentView.view != 'search') {
      switch (_currentView.key) {
        case 'home':
          GlobalKeys.homeNavigator.currentState!.pushNamed("/home/search");
          break;
        case 'transport':
          GlobalKeys.transportNavigator.currentState!.pushNamed("/transport/search");
          break;
        case 'trade':
          GlobalKeys.tradeNavigator.currentState!.pushNamed("/trade/search");
          break;
        case 'place':
          GlobalKeys.placeNavigator.currentState!.pushNamed("/place/search");
          break;
        case 'delivery':
          GlobalKeys.deliveryNavigator.currentState!.pushNamed("/delivery/search");
          break;
        case 'payment':
          GlobalKeys.paymentNavigator.currentState!.pushNamed("/payment/search");
          break;
        case 'user':
          GlobalKeys.userNavigator.currentState!.pushNamed("/user/search");
          break;
      }
    }
  }

  void _handleOpenNotification() {
    if (_currentView.view != 'notification') {
      switch (_currentView.key) {
        case 'home':
          GlobalKeys.homeNavigator.currentState!.pushNamed("/home/notification");
          break;
        case 'transport':
          GlobalKeys.transportNavigator.currentState!.pushNamed("/transport/notification");
          break;
        case 'trade':
          GlobalKeys.tradeNavigator.currentState!.pushNamed("/trade/notification");
          break;
        case 'place':
          GlobalKeys.placeNavigator.currentState!.pushNamed("/place/notification");
          break;
        case 'delivery':
          GlobalKeys.deliveryNavigator.currentState!.pushNamed("/delivery/notification");
          break;
        case 'payment':
          GlobalKeys.paymentNavigator.currentState!.pushNamed("/payment/notification");
          break;
        case 'user':
          GlobalKeys.userNavigator.currentState!.pushNamed("/user/notification");
          break;
      }
    }
  }

  void _handleOpenDrawer() {
    GlobalKeys.mainScaffold.currentState!.openDrawer();
  }

  void _handleShowBars() {
    // print("show bar");
    _animController.forward();
  }

  void _handleHideBars() {
    // print("Hide bar");
    _animController.reverse();
  }

  void _handleBarItemTap(int index) {
    print('_handleBarItemTap');

    _pageController.jumpToPage(index);
  }

  void _handlePageChanged(int index) {
    print('_handlePageChanged');

    if (index > 0) {
      _currentView = mainViews[index];
      if (_willPop) {
        _viewTracking.removeLast(); // Remove last view key on win pop
      } else {
        _viewTracking.add(_currentView.key!); // Add new view key to history
      }
      if (_viewTracking.length > Configuration.pageTrackingLimited) _viewTracking.removeAt(0);
    } else {
      _currentView = mainViews[0];
      _viewTracking = <String>[_currentView.key!]; // Back to Mainpage: reset changed history
    }

    // _scrollTick = ScrollDirection.idle;

    _handleShowBars();

    setState(() {});
  }

  void _handleCallback({String? key, String? view, String? title, IconData? icon, Color? color}) {
    print('_handleCallback');

    final nextView = mainViews.firstWhere(
      (mainView) => mainView.key == key,
    );

    if (nextView != null) {
      if (view != null) nextView.view = view;
      if (title != null) nextView.title = title;
      if (icon != null) nextView.icon = icon;
      if (color != null) nextView.color = color;
      _currentView = nextView;
    }

    _scrollTick = ScrollDirection.idle;

    _handleShowBars();

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  }

  Future<bool> _handleWillPop() async {
    print('_handleWillPop');

    setState(() {
      _scrollTick = ScrollDirection.idle;
    });

    _handleShowBars();

    if (!_isMainView && _currentView.key == 'home') {
      if (GlobalKeys.homeNavigator.currentState! != null) {
        GlobalKeys.homeNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'transport') {
      if (GlobalKeys.transportNavigator.currentState! != null) {
        GlobalKeys.transportNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'trade') {
      if (GlobalKeys.tradeNavigator.currentState! != null) {
        GlobalKeys.tradeNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'place') {
      if (GlobalKeys.placeNavigator.currentState! != null) {
        GlobalKeys.placeNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'delivery') {
      if (GlobalKeys.deliveryNavigator.currentState! != null) {
        GlobalKeys.deliveryNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'payment') {
      if (GlobalKeys.paymentNavigator.currentState! != null) {
        GlobalKeys.paymentNavigator.currentState!.maybePop();
        return false;
      }
    }

    if (!_isMainView && _currentView.key == 'user') {
      if (GlobalKeys.userNavigator.currentState! != null) {
        GlobalKeys.userNavigator.currentState!.maybePop();
        return false;
      }
    }

    String firstPageKey = mainViews[0].key!;
    String lastPageKey = _viewTracking.last;
    int totalPageKeys = _viewTracking.length;

    if (totalPageKeys != 1 || lastPageKey != firstPageKey) {
      // setState(() {
      //   _willPop = true;
      // });

      int goBackIndex = 0;

      if (totalPageKeys > 1 && lastPageKey != firstPageKey) {
        goBackIndex = mainViews.indexWhere((page) => page.key == _viewTracking[totalPageKeys - 2]);
      }

      _pageController.jumpToPage(goBackIndex);

      // setState(() {
      //   _willPop = false;
      // });

      return false;
    }

    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(St.of(context).confirm),
            content: new Text(St.of(context).applicationClosingConfirmation),
            actions: <Widget>[
              new FlatButton(
                  child: Text(St.of(context).no),
                  onPressed: () => Navigator.of(context).pop(false)),
              new FlatButton(
                  child: Text(St.of(context).yes),
                  onPressed: () => Navigator.of(context).pop(true)),
            ],
          ),
        )) ??
        false;
  }

  bool _handleNotification(UserScrollNotification scroll) {
    AxisDirection axisDirection = scroll.metrics.axisDirection;
    if (axisDirection == AxisDirection.down || axisDirection == AxisDirection.up) {
      switch (scroll.direction) {
        case ScrollDirection.idle:
          break;
        case ScrollDirection.reverse:
          if (_scrollTick != ScrollDirection.reverse) {
            _handleHideBars();
            // setState(() {
            //   _scrollTick = ScrollDirection.reverse;
            // });
          }
          break;
        default:
          if (_scrollTick != ScrollDirection.forward) {
            _handleShowBars();
            // setState(() {
            //   _scrollTick = ScrollDirection.forward;
            // });
          }
      }
    }
    return false;
  }

  @override
  void dispose() {
    _animController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
