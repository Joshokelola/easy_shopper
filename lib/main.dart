import 'package:easy_shopper/controller/bloc/bloc_observer.dart';
import 'package:easy_shopper/controller/repository/get_product_repo.dart';
import 'package:easy_shopper/views/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'controller/bloc/products_bloc.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Bloc.observer = const GetProductsBlocObserver();
  runApp(RepositoryProvider(
    create: (context) => GetProductsRepoImpl(),
    child: BlocProvider(
      create: (context) => ProductsBloc(
        getProductsRepoImpl: RepositoryProvider.of(context),
      ),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharrie\'s Signature',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
    
    );
  }
}
