import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tweetshort/styles/style.dart';

import '../controller/editor_controller.dart';
import '../extentions/extentions.dart';
import '../widgets/button.dart';
import '../widgets/suspense.dart';
import '../widgets/tweet_images.dart';

class Editor extends StatelessWidget {
  const Editor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int time = 800;

    return Scaffold(
      body: GetBuilder<EditorController>(
        init: EditorController(),
        builder: (controller) => STEMSuspense(
          appState: controller.appState,
          loadingWidget: Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: Center(
            child: Text("Error, something bad happened."),
          ),
          successWidget: (_) => Stack(
            children: [
              RepaintBoundary(
                key: controller.globalKey,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: [0.1, 0.5],
                        colors: controller.backgroundColor,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        tileMode: TileMode.repeated),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 13,
                            ),
                            margin: EdgeInsets.only(
                              top: 10.h,
                              left: 3.3.w,
                              right: 3.3.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 8.w,
                                      height: 8.w,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            controller.tweet!.profileImage,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300] as Color,
                                          highlightColor: Colors.white,
                                          period: Duration(milliseconds: time),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                50,
                                              ),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.tweet!.tileName
                                              .utf8convert(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "@${controller.tweet!.username.utf8convert()}",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.tweet!.fullText.utf8convert(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                if (controller.tweet?.isQuoteStatus ?? false)
                                  Container(
                                    width: 100.w,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              width: 8.w,
                                              height: 8.w,
                                              child: CachedNetworkImage(
                                                imageUrl: controller.tweet!
                                                    .quotedTweet!.profileImage,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Shimmer.fromColors(
                                                  baseColor:
                                                      Colors.grey[300] as Color,
                                                  highlightColor: Colors.white,
                                                  period: Duration(
                                                      milliseconds: time),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        50,
                                                      ),
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            Text(
                                              "${controller.tweet!.quotedTweet!.tileName.utf8convert().truncateText()}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "@${controller.tweet!.quotedTweet!.username.utf8convert().truncateText()}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(controller
                                            .tweet!.quotedTweet!.fullText
                                            .utf8convert()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.tweet!.createdAt
                                              .convertToData(),
                                          style: TextStyle(
                                            color: TWEETSHortStyle.hexToColor(
                                              "#7e8b95",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: 1,
                                ),
                                if (controller.tweet!.extenedMedia.isNotEmpty)
                                  TweetImages(
                                    extendImages:
                                        controller.tweet!.extenedMedia,
                                  ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.tweet!.createdAt
                                          .convertToData(),
                                      style: TextStyle(
                                        color: TWEETSHortStyle.hexToColor(
                                          "#7e8b95",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.tweet!.retweetCount
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Retweet",
                                          style: TextStyle(
                                            color: TWEETSHortStyle.hexToColor(
                                              "#7e8b95",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controller.tweet!.favoriteCount
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Likes",
                                          style: TextStyle(
                                            color: TWEETSHortStyle.hexToColor(
                                              "#7e8b95",
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment(0, 0.95),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 3.5.h,
                        width: 100.w,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.colors
                              .map(
                                (e) => InkWell(
                                  onTap: () => controller.setBackgroundColor(e),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: e,
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                      ),
                                    ),
                                    width: 50,
                                  ),
                                ),

                                ///#7e8b95
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TWEETSHORTButton(
                              height: 5.h,
                              width: 100.w,
                              color: Colors.black,
                              onPressed: () => controller.saveScreenshot(),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TWEETSHORTButton(
                              height: 5.h,
                              width: 100.w,
                              color: Colors.grey,
                              onPressed: () => Share.share(
                                  "Create beautiful twitter screenshots, with tweetshort."),
                              child: Text(
                                "Share",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
