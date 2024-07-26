enum AppPages { buildView, tela2, tela3 }

class AppRoutes {
  static String pageName(AppPages page) {
    switch (page) {
      case AppPages.buildView:
        return '/buildView';
      case AppPages.tela2:
        return '/tela2';
      case AppPages.tela3:
        return '/tela3';
      default:
        return '/buildView';
    }
  }
}
