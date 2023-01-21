class CategoryModel {
  final String productDetail;
  final String productImage;
  final String productname;
  final int price;
  int qan;

  int getToal() {
    return qan * price;
  }

  CategoryModel({
    required this.productDetail,
    required this.productImage,
    required this.price,
    required this.productname,
    this.qan = 1,
  });

  static List<CategoryModel> productList = [
    CategoryModel(
        productname: 'Straw Bale',
        productDetail: " "
            "Straw-bale construction is a building method that commonly uses straw from wheat, rice, rye and oats, as building insulation. The straw is the stalk of the grain without the grain head. Straw-bale construction has many advantages, including the carbon sequestration of the material, low cost, availability, fire-resistance, and insulation values.",
        productImage:
            'https://cdn.pixabay.com/photo/2016/12/29/05/50/isolated-1937831_960_720.png',
        price: 100),
    // CategoryModel(
    //     productname: 'joystick',
    //     productDetail: 'Electronics',
    //     productImage: 'ssets/product_images/backet.jpg',
    //     price: 500),

    CategoryModel(
        productname: 'Mala',
        productDetail: 'Beauty',
        productImage:
            'https://thumbs.dreamstime.com/z/nepalese-traditional-handicrafts-souvenirs-kathmandu-nepal-103796225.jpg',
        price: 10),

    CategoryModel(
        productname: 'Kukuri',
        productDetail: 'Sport',
        productImage:
            'https://i0.wp.com/handicraftsinnepal.com/wp-content/uploads/2019/02/Khukuri.jpg?resize=1020%2C676&ssl=1',
        price: 100),
    CategoryModel(
        productname: 'Chair',
        productDetail: 'Food and more',
        productImage:
            'https://images.squarespace-cdn.com/content/v1/5b2aca7896d45511d05bb6b2/1596274121002-244K95H7H2UVEFC9RKFP/3.jpg',
        price: 2500),
  ];
}
