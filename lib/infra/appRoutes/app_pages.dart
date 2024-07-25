enum AppPages { tela1, tela2, tela3 }

class AppRoutes {
  static String pageName(AppPages page) {
    switch (page) {
      case AppPages.tela1:
        return '/tela1';
      case AppPages.tela2:
        return '/tela2';
      case AppPages.tela3:
        return '/tela3';
      default:
        return '/tela1';
    }
  }
}
