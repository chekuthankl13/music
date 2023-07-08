import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/logic/bloc_export.dart';
import 'package:music/presentation/home/home_screen.dart';
import 'package:music/utils/utils.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   height: kToolbarHeight,
      //   color: Colors.transparent,
      // ),
      body: Stack(
        children: [
          Container(
            height: sH(context),
            width: sW(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage(
                    "assets/1.jpg",
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<MusicCubit, MusicState>(
                    listener: (context, state) {
                      if (state is MusicLoadError) {
                        errorToast(context, error: state.error);
                      }
                      if (state is MusicLoaded) {
                        navigatorKey.currentState!
                            .pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is MusicLoading) {
                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              fixedSize: Size(sW(context) / 2, 10)),
                          child: const CupertinoActivityIndicator(
                              color: Colors.white),
                        );
                      }

                      return ElevatedButton(
                        onPressed: () {
                          context.read<MusicCubit>().getMusics();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            fixedSize: Size(sW(context) / 2, 10)),
                        child: Text("Get started"),
                      );
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
