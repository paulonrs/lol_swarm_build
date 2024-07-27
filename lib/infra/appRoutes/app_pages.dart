enum AppPages { buildView, tela2, selectHero, selectWeapon, selectPassive }

class AppRoutes {
  static String pageName(AppPages page) {
    switch (page) {
      case AppPages.buildView:
        return '/buildView';
      case AppPages.tela2:
        return '/tela2';
      case AppPages.selectHero:
        return '/selectHero';
      case AppPages.selectWeapon:
        return '/selectWeapon';
      case AppPages.selectPassive:
        return '/selectPassive';
      default:
        return '/buildView';
    }
  }
}
