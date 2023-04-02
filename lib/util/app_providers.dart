import 'package:proshore_even_manager_app/provider/events_provider.dart';
import 'package:proshore_even_manager_app/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<LoginProvider>(
    create: (context) => LoginProvider(),
  ),
  ChangeNotifierProvider<EventsProvider>(
    create: (context) => EventsProvider(),
  ),
];
