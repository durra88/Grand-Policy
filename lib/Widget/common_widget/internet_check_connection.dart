import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CheckInternetWidget extends StatelessWidget {
  const CheckInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       var language = AppLocalizations.of(context);
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 60,
        //padding: const EdgeInsets.only(top: 50),
        child: FittedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset('assets/animations/no_internet.json',
                    width: 300, height: 240),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  language!.noInternet,
                  style: GoogleFonts.actor(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ]),
        ));
  }
}
