import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/service/local_stronge_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/local_storage_keys.dart';
import '../../core/providers/local_provider.dart';
import '../../core/providers/theme_provider.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late ThemeProvider themeProvider;
  late LocalProvider localProvider;
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    localProvider = Provider.of<LocalProvider>(context);
    appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.onboardingLogo).setHorizontalPadding(
              context,
              0.30,
              enableMediaQuery: true,
            ),
            SizedBox(
              height: .03.height,
            ),
            Image.asset("assets/images/being_creative.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    appLocalizations.setup_title,
                    style:Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                   Text(
                     appLocalizations.setup_description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: .03.height,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Text(
                        appLocalizations.language,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      AnimatedToggleSwitch.rolling(
                        onChanged: (value) {
                          localProvider.lang = value;
                        },
                        style: ToggleStyle(
                          backgroundColor: Colors.transparent,
                          borderColor: Theme.of(context).colorScheme.primary,
                          indicatorColor: Theme.of(context).colorScheme.primary,
                        ),
                        current: localProvider.lang,
                        values:const ["ar", "en"],
                        iconBuilder: (value, foreground) {
                          if (value == "en") {
                            return Image.asset("assets/icons/en_lan.png");
                          } else {
                            return Image.asset("assets/icons/ar_lang.png");
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalizations.theme,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      AnimatedToggleSwitch.rolling(
                        onChanged: (value) {
                          themeProvider.themeMode = value;
                        },
                        style: ToggleStyle(
                          backgroundColor: Colors.transparent,
                          borderColor: Theme.of(context).colorScheme.primary,
                          indicatorColor: Theme.of(context).colorScheme.primary,
                        ),
                        current: themeProvider.themeMode,
                        values:const [ThemeMode.light, ThemeMode.dark],
                        iconBuilder: (value, foreground) {
                          if (value == ThemeMode.light) {
                            return  Icon(
                              Icons.light_mode,
                              color: themeProvider.isDarkMode()
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                            );
                          } else {
                            return Icon(
                              Icons.dark_mode,
                              color: themeProvider.isDarkMode()
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                            );
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                  TextButton(
                    onPressed: () {
                      LocalStorageService.setBool(
                          LocalStorageKeys.isFirstTimeRun, false);
                      Navigator.pushNamed(context, ScreensRouteName.onBoardingScreen);
                    },
                    child: const Text(
                      "Let’s Start",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
