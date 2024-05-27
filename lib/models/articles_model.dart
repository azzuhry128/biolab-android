class ArticlesModel {
  String name;
  String iconPath;

  ArticlesModel({
    required this.name,
    required this.iconPath,
  });

  static List<ArticlesModel> getArticles() {
    List<ArticlesModel> articles = [];

    articles.add(ArticlesModel(
        name: 'syringe', iconPath: 'assets/icons/bxs-capsule.svg'));

    articles.add(ArticlesModel(
        name: 'syringe', iconPath: 'assets/icons/bxs-capsule.svg'));

    articles.add(ArticlesModel(
        name: 'syringe', iconPath: 'assets/icons/bxs-capsule.svg'));

    articles.add(ArticlesModel(
        name: 'syringe', iconPath: 'assets/icons/bxs-capsule.svg'));

    articles.add(ArticlesModel(
        name: 'syringe', iconPath: 'assets/icons/bxs-capsule.svg'));

    return articles;
  }
}
