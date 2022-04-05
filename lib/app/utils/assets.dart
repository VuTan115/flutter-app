import 'package:flutter/material.dart';

class Assets {
  static const String assetsUrl = 'assets';

  static const String fontsUrl = '$assetsUrl/fonts';
  static const String iconsUrl = '$assetsUrl/icons';
  static const String imagesUrl = '$assetsUrl/images';
  static const String stylesUrl = '$assetsUrl/styles';

  static final String appIcon = '$iconsUrl/app_icon.png';
}

class LightIcons {
  static const String lightIconsUrl = '${Assets.iconsUrl}/light';

  static final String ad = '$lightIconsUrl/ad.svg';
  static final String bagsShopping = '$lightIconsUrl/bags-shopping.svg';
  static final String car = '$lightIconsUrl/car.svg';
  static final String cars = '$lightIconsUrl/cars.svg';
  static final String carBus = '$lightIconsUrl/car-bus.svg';
  static final String carBuilding = '$lightIconsUrl/car-building.svg';
  static final String clipboardUser = '$lightIconsUrl/clipboard-user.svg';
  static final String creditCard = '$lightIconsUrl/credit-card.svg';
  static final String creditCardFront = '$lightIconsUrl/credit-card-front.svg';
  static final String grin = '$lightIconsUrl/grin.svg';
  static final String grinBeam = '$lightIconsUrl/grin-beam.svg';
  static final String grinHearts = '$lightIconsUrl/grin-hearts.svg';
  static final String grinTongue = '$lightIconsUrl/grin-tongue.svg';
  static final String grinTongueWink = '$lightIconsUrl/grin-tongue-wink.svg';
  static final String handshake = '$lightIconsUrl/handshake.svg';
  static final String link = '$lightIconsUrl/link.svg';
  static final String location = '$lightIconsUrl/location.svg';
  static final String mapMarkerAlt = '$lightIconsUrl/map-marker-alt.svg';
  static final String mapPin = '$lightIconsUrl/map-pin.svg';
  static final String plus = '$lightIconsUrl/plus.svg';
  static final String searchLocation = '$lightIconsUrl/search-location.svg';
  static final String shoppingCart = '$lightIconsUrl/shopping-cart.svg';
  static final String sunCloud = '$lightIconsUrl/sun-cloud.svg';
  static final String taxi = '$lightIconsUrl/taxi.svg';
  static final String truck = '$lightIconsUrl/truck.svg';
  static final String home = '$lightIconsUrl/home.svg';
  static final String homeAlt = '$lightIconsUrl/home-alt.svg';
  static final String mapMarkerCheck = '$lightIconsUrl/map-marker-check.svg';
  static final String shippingFast = '$lightIconsUrl/shipping-fast.svg';
  static final String mapMarked = '$lightIconsUrl/map-marked.svg';
  static final String mapMarkedAlt = '$lightIconsUrl/map-marked-alt.svg';
  static final String userCircle = '$lightIconsUrl/user-circle.svg';
}

class RegularIcons {
  static const String regularIconsUrl = '${Assets.iconsUrl}/regular';

  static final String link = '$regularIconsUrl/link.svg';
  static final String ad = '$regularIconsUrl/ad.svg';
}

class SolidIcons {
  static const String solidIconsUrl = '${Assets.iconsUrl}/solid';

  static final String cars = '$solidIconsUrl/cars.svg';
  static final String tags = '$solidIconsUrl/tags.svg';
  static final String home = '$solidIconsUrl/home.svg';
  static final String carBus = '$solidIconsUrl/car-bus.svg';
  static final String carBuilding = '$solidIconsUrl/car-building.svg';
  static final String bagsShopping = '$solidIconsUrl/bags-shopping.svg';
  static final String mapMarkerAlt = '$solidIconsUrl/map-marker-alt.svg';
  static final String mapMarkedAlt = '$solidIconsUrl/map-marked-alt.svg';
  static final String creditCard = '$solidIconsUrl/credit-card.svg';
  static final String userCircle = '$solidIconsUrl/user-circle.svg';
}

class DuotoneIcons {
  static const String duotoneIconsUrl = '${Assets.iconsUrl}/duotone';

  static final String bagsShopping = '$duotoneIconsUrl/bags-shopping.svg';
}

class Images {
  static const String imagesUrl = Assets.imagesUrl;

  static final AssetImage homeSearchBg = AssetImage('$imagesUrl/bg3.png');
}

class ImageUrls {
  static const String imagesUrl = Assets.imagesUrl;

  static final String defaultProfilePhoto =
      '$imagesUrl/default_profile_photo.png';
}

class MapStyles {
  static const String mapStylesUrl = '${Assets.stylesUrl}/map';

  static final String light = '$mapStylesUrl/light.json';
  static final String dark = '$mapStylesUrl/dark.json';
}
