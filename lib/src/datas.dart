import 'models/Product.dart';
import 'models/categories.dart';

List<Product> foods = [
    Product(
        idPdt: 1,
        name: "Hamburger",
        image: "images/HAMBURGER 1000.jpg",
        price: 1000,
        menuPrice: null,
        isMenu: '',
        cat: 1,
        // userLiked: true,
        discount: 10
    ),
    Product(
        idPdt: 2,
        name: "Cheese burger",
        image: "images/CHEESE BURGER1500.jpg",
        price: 1500,
        menuPrice: null,
        isMenu: '',
        cat: 1,
        // userLiked: false,
        discount: null
    ),
    Product(
      idPdt: 3,
      name: "Double cheese burger",
      image: 'images/double CHEESE BURGER.jpg',
      price: 2500,
      menuPrice: 3500,
      isMenu: 'Menu',
      cat: 1,
      // userLiked: false,
    ),
    Product(
        idPdt: 4,
        name: "Chicken burger",
        image: "images/CHICKEN BURGER.jpg",
        price: 3500,
        menuPrice: 45000,
        isMenu: 'Menu',
        cat: 1,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 5,
        name: "Veggie burger",
        image: "images/VEGGIE BURGER.jpg",
        price: 3500,
        menuPrice: 43000,
        isMenu: 'Menu',
        cat: 1,
        // userLiked: true,
        // discount: 3
    ),

     Product(
        idPdt: 6,
        name: "Smoked burger",
        image: "images/SMOKED CHICKEN Burger.jpg",
        price: 3500,
        menuPrice: 4500,
        isMenu: 'Menu',
        cat: 1,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 7,
        name: "Country burger",
        image: "images/COUNTRY BURGER.jpg",
        price: 4000,
        menuPrice: 5000,
        isMenu: 'Menu',
        cat: 1,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 8,
        name: "Hit burger",
        image: "images/HIT BURGER.jpg",
        price: 6000,
        menuPrice: null,
        isMenu: '',
        cat: 1,
        // userLiked: true,
        // discount: 3
    )
];

List<Categories> categorie = [
  Categories(
    id: 1,
    name: 'Chicken',
    image: 'turkey.png',
    onPress: null,
  ),

  Categories(
    id: 2,
    name: 'Burgers',
    image: 'burger.png',
    onPress: null,
  ),

  Categories(
    id: 3,
    name: 'Tacos',
    image: 'tacos.png',
    onPress: null,
  ),

  Categories(
    id: 4,
    name: 'Sandwichs',
    image: 'sandw.jpg',
    onPress: null,
  ),

  Categories(
    id: 5,
    name: 'Hot Dog',
    image: 'hotdog.jpg',
    onPress: null,
  ),

  Categories(
    id: 6,
    name: 'Salades',
    image: 'salad.jpg',
    onPress: null,
  ),

  Categories(
    id: 7,
    name: 'Gourmandises',
    image: 'waffle.jpg',
    onPress: null,
  ),

  Categories(
    id: 8,
    name: 'Boisson',
    image: 'beer.png',
    onPress: null,
  ),

  Categories(
    id: 9,
    name: 'Grillades',
    image: 'grill.jpg',
    onPress: null,
  ),
];
