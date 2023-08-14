import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/loading_shimmer_skeleton.dart';
import 'package:lumainar/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PlacementContainer extends StatefulWidget {
  const PlacementContainer({super.key});

  @override
  State<PlacementContainer> createState() => _PlacementContainerState();
}

class _PlacementContainerState extends State<PlacementContainer> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider =
          Provider.of<HomeScreenController>(context, listen: false);

      await provider.fetchInstagramPosts();

      print(provider.courseList.isEmpty);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenController>(context);
    final instaPostList =
        Provider.of<HomeScreenController>(context).instaPostList;
    print(instaPostList.length.toString() + "POOOOST1");

    return provider.isInstagramLoading
        ? CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(child: ShimmerSkeleton()),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 8,
              viewportFraction: 0.5,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          )
        : CarouselSlider.builder(
            itemCount: instaPostList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final post = instaPostList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: post.mediaUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/banner/banner.jpg'),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 8,
              viewportFraction: 0.5,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          );
  }
}
