import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/logic/bloc_export.dart';
import 'package:music/presentation/home/detail_screen.dart';
import 'package:music/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          if (state is MusicLoaded) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.musics.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[200]!,
              ),
              itemBuilder: (context, index) {
                var data = state.musics[index];

                return ListTile(
                  onTap: () {
                    navigatorKey.currentState!.push(MaterialPageRoute(
                      builder: (context) => DetailScreen(data: data),
                    ));
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      data.img,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    data.trackName,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          spaceWidth(2),
                          Text(data.artisit,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text(data.shortDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: 9, color: Colors.grey)),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
