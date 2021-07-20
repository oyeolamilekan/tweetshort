import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../extentions/extentions.dart';

class TweetImages extends StatelessWidget {
  final List extendImages;

  TweetImages({
    Key? key,
    required this.extendImages,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int time = 800;

    if (extendImages.length == 4) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    child: CachedNetworkImage(
                      imageUrl: extendImages[0],
                      imageBuilder: (context, imageProvider) => Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300] as Color,
                        highlightColor: Colors.white,
                        period: Duration(milliseconds: time),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    child: CachedNetworkImage(
                      imageUrl: extendImages[1],
                      imageBuilder: (context, imageProvider) => Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300] as Color,
                        highlightColor: Colors.white,
                        period: Duration(milliseconds: time),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    child: CachedNetworkImage(
                      imageUrl: extendImages[2],
                      imageBuilder: (context, imageProvider) => Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300] as Color,
                        highlightColor: Colors.white,
                        period: Duration(milliseconds: time),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    child: CachedNetworkImage(
                      imageUrl: extendImages[3],
                      imageBuilder: (context, imageProvider) => Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300] as Color,
                        highlightColor: Colors.white,
                        period: Duration(milliseconds: time),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    } else if (extendImages.length == 3) {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 30.h,
              width: 50.w,
              child: CachedNetworkImage(
                imageUrl: extendImages[0],
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300] as Color,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: time),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 14.2.h,
                  child: CachedNetworkImage(
                    imageUrl: extendImages[1],
                    imageBuilder: (context, imageProvider) => Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300] as Color,
                      highlightColor: Colors.white,
                      period: Duration(milliseconds: time),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 14.2.h,
                  child: CachedNetworkImage(
                    imageUrl: extendImages[2],
                    imageBuilder: (context, imageProvider) => Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300] as Color,
                      highlightColor: Colors.white,
                      period: Duration(milliseconds: time),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    } else if (extendImages.length == 2) {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 35.h,
              width: 50.w,
              child: CachedNetworkImage(
                imageUrl: extendImages[0],
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300] as Color,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: time),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 35.h,
              width: 50.w,
              child: CachedNetworkImage(
                imageUrl: extendImages[1],
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300] as Color,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: time),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )
        ],
      );
    } else {
      return Container(
        height: 20.h,
        width: 100.w,
        child: CachedNetworkImage(
          imageUrl: extendImages[0],
          imageBuilder: (context, imageProvider) => Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300] as Color,
            highlightColor: Colors.white,
            period: Duration(milliseconds: time),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: Colors.grey,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );
    }
  }
}
