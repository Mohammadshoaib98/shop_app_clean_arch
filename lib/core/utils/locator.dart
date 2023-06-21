// final locator = GetIt.instance;

// Future<void> initializeDependencies() async {
//   final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
//   locator.registerSingleton<AppDatabase>(db);

//   final dio = Dio();
//   dio.interceptors.add(AwesomeDioInterceptor());

//   locator.registerSingleton<Dio>(dio);

//   locator.registerSingleton<NewsApiService>(
//     NewsApiService(locator<Dio>()),
//   );

//   locator.registerSingleton<ApiRepository>(
//     ApiRepositoryImpl(locator<NewsApiService>()),
//   );

//   locator.registerSingleton<DatabaseRepository>(
//     DatabaseRepositoryImpl(locator<AppDatabase>()),
//   );
// }