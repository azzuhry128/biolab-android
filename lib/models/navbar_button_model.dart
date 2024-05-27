class NavbarButtonModel {
  String name;
  String iconPath;

  NavbarButtonModel({required this.name, required this.iconPath});

  static List<NavbarButtonModel> getNavbarButtons() {
    List<NavbarButtonModel> navbarButton = [];

    navbarButton.add(NavbarButtonModel(
      name: 'home',
      iconPath: 'assets/icons/bxs-home-alt-2.svg',
    ));

    navbarButton.add(NavbarButtonModel(
      name: 'order',
      iconPath: 'assets/icons/bxs-book-content.svg',
    ));

    navbarButton.add(NavbarButtonModel(
      name: 'settings',
      iconPath: 'assets/icons/bxs-cog.svg',
    ));

    return navbarButton;
  }
}
