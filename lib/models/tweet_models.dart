class TweetModel {
  final String tileName;
  final String username;
  final String source;
  final String profileImage;
  final String createdAt;
  final String fullText;
  final int retweetCount;
  final int favoriteCount;
  final List extenedMedia;
  final QuotedTweet? quotedTweet;
  final bool isQuoteStatus;

  const TweetModel({
    required this.tileName,
    required this.username,
    required this.source,
    required this.profileImage,
    required this.createdAt,
    required this.fullText,
    required this.retweetCount,
    required this.favoriteCount,
    required this.extenedMedia,
    required this.quotedTweet,
    required this.isQuoteStatus,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) {
    return TweetModel(
      tileName: json['user_display_name'],
      username: json['username'],
      source: json['source'],
      profileImage: json['profile_image'],
      createdAt: json['created_at'],
      fullText: json['full_text'],
      retweetCount: json['retweet_count'],
      favoriteCount: json['favorite_count'],
      extenedMedia: json['extened_media'],
      quotedTweet: json['quoted_tweet'] != null && !json['quoted_tweet'].isEmpty
          ? QuotedTweet.fromJson(json['quoted_tweet'])
          : null,
      isQuoteStatus: json['is_quote_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tile_name'] = this.tileName;
    data['username'] = this.username;
    data['source'] = this.source;
    data['profile_image'] = this.profileImage;
    data['created_at'] = this.createdAt;
    data['full_text'] = this.fullText;
    data['retweet_count'] = this.retweetCount;
    data['favorite_count'] = this.favoriteCount;
    data['extened_media'] = this.extenedMedia;
    if (this.quotedTweet != null) {
      data['quoted_tweet'] = this.quotedTweet?.toJson();
    }
    data['is_quote_status'] = this.isQuoteStatus;
    return data;
  }
}

class QuotedTweet {
  final String profileImage;
  final String fullText;
  final String tileName;
  final String username;
  final String createdAt;

  QuotedTweet({
    required this.profileImage,
    required this.fullText,
    required this.tileName,
    required this.username,
    required this.createdAt,
  });

  factory QuotedTweet.fromJson(Map<String, dynamic> json) {
    return QuotedTweet(
      profileImage: json['profile_image'],
      fullText: json['full_text'],
      tileName: json['tile_name'],
      username: json['username'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['full_text'] = this.fullText;
    data['tile_name'] = this.tileName;
    data['username'] = this.username;
    data['created_at'] = this.createdAt;
    return data;
  }
}
