import '../models/product_model.dart';
import '../models/variant_model.dart';

List<ProductModel> dataProducts = [
  ProductModel(
    0,
    '2',
    20,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Samsung Galaxy A07',
    image: 'assets/images/samsung-galaxy07.webp',
    price: 1200000,
    category: Category.smartphoneTablet,
    rating: 4.5,
    review: 42,
    variants: [
      VariantModel(name: "Color", options: ["Blue", "Black"]),
      VariantModel(name: "Storage", options: ["64GB", "128GB"]),
    ],
    location: 'Jakarta',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    1,
    '2',
    15,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Tas Wanita',
    image: 'assets/images/pouche.jpg',
    price: 120000,
    category: Category.fashion,
    rating: 4.5,
    review: 42,
    variants: [
      VariantModel(name: "Color", options: ["Brown", "Cream"]),
    ],
    location: 'Malang',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    2,
    'seller_merlin',
    10,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Tas Wanita Premium',
    image: 'assets/images/tas.jpg',
    price: 150000,
    category: Category.fashion,
    rating: 4.7,
    review: 57,
    variants: [
      VariantModel(name: "Color", options: ["Black", "Beige"]),
    ],
    location: 'Semarang',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    3,
    '2',
    30,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Sepatu Lari',
    image: 'assets/images/run-shoe.jpg',
    price: 200000,
    category: Category.sport,
    rating: 4.6,
    review: 35,
    variants: [
      VariantModel(name: "Size", options: ["40", "41", "42"]),
    ],
    location: 'Batu',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    4,
    '2',
    12,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Jaket Olahraga',
    image: 'assets/images/sportswear.webp',
    price: 200000,
    category: Category.sport,
    rating: 4.4,
    review: 28,
    variants: [
      VariantModel(name: "Size", options: ["M", "L", "XL"]),
    ],
    location: 'Bandung',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    5,
    'seller_hadi',
    50,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Oli Mobil',
    image: 'assets/images/car-oil.jpg',
    price: 50000,
    category: Category.otomotif,
    rating: 4.8,
    review: 120,
    variants: [
      VariantModel(name: "Type", options: ["5W-30", "10W-40"]),
    ],
    location: 'Yogyakarta',
    isFavorite: false,
    isChosenCart: false,
  ),
  ProductModel(
    6,
    'seller_hadi',
    18,
    //product description
    '',
    //web image
    webImage: null,
    title: 'Cat Mobil',
    image: 'assets/images/repairing-paint.jpg',
    price: 80000,
    category: Category.otomotif,
    rating: 4.3,
    review: 21,
    variants: [
      VariantModel(name: "Color", options: ["Red", "Black", "White"]),
    ],
    location: 'Medan',
    isFavorite: false,
    isChosenCart: false,
  ),
];
