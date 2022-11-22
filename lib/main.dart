import 'package:ecomm_bloc/bloc/addtocart/addcart_bloc.dart';
import 'package:ecomm_bloc/bloc/authbloc/auth_bloc.dart';
import 'package:ecomm_bloc/bloc/categories/categories_cubit.dart';
import 'package:ecomm_bloc/bloc/getcart/getcart_cubit.dart';
import 'package:ecomm_bloc/bloc/myorder/myorder_cubit.dart';
import 'package:ecomm_bloc/bloc/orderplace/placeorder_bloc.dart';
import 'package:ecomm_bloc/bloc/productdetails/productdetails_cubit.dart';
import 'package:ecomm_bloc/bloc/subcategory/subcategory_bloc.dart';
import 'package:ecomm_bloc/presentation/Auth/login_page.dart';
import 'package:ecomm_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:ecomm_bloc/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/services/locator.dart';
import 'sharedprefs/shared_prefs_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
      ),
      BlocProvider<CategoriesCubit>(
        create: (context) => CategoriesCubit(),
      ),
      BlocProvider<SubcategoryBloc>(
        create: (context) => SubcategoryBloc(),
      ),
      BlocProvider<GetcartCubit>(
        create: (context) => GetcartCubit(),
      ),
      BlocProvider<AddcartBloc>(
        create: (context) => AddcartBloc(),
      ),
      BlocProvider<ProductdetailsCubit>(
        create: (context) => ProductdetailsCubit(),
      ),
      BlocProvider<PlaceorderBloc>(
        create: (context) => PlaceorderBloc(),
      ),
      BlocProvider<MyorderCubit>(
        create: (context) => MyorderCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _prefs = getIt.get<SharedPreferenceHelper>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: _prefs.getValues("token") == null
            ? const LoginPage()
            : const DashboardPage());
  }
}
