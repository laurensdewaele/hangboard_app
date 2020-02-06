import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:app/data/basic_settings.dart';
import 'package:app/routes/routes.dart';
import 'package:app/services/persistence.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/view_models/app_state_vm.dart';
import 'package:app/view_models/extra_tab_vm.dart';
import 'package:app/view_models/general_tab_vm.dart';
import 'package:app/view_models/hold_tab_vm.dart';
import 'package:app/view_models/settings_vm.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PersistenceService>(create: (context) => PersistenceService()),
        ChangeNotifierProvider(
            create: (context) => AppState(
                Provider.of<PersistenceService>(context, listen: false))),
        ProxyProvider<AppState, GeneralTabViewModel>(
            update: (context, appState, generalTabViewModel) =>
                GeneralTabViewModel(appState)),
        ProxyProvider<AppState, HoldTabViewModel>(
            update: (context, appState, holdTabViewModel) =>
                HoldTabViewModel(appState)),
        ProxyProvider<AppState, ExtraTabViewModel>(
            update: (context, appState, extraTabViewModel) =>
                ExtraTabViewModel(appState)),
        ChangeNotifierProvider<SettingsViewModel>(
          create: (context) => defaultSettingsViewModel,
        ),
      ],
      child: CupertinoApp(
          routes: getRoutes(context), color: styles.Colors.primary),
    );
  }
}
