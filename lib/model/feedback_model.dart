class FeedbackModel {
  String bookPic;
  String title;
  String aboutBook;
  String barCode;

  FeedbackModel({
    this.bookPic,
    this.title,
    this.aboutBook,
    this.barCode,
  });

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      bookPic: "${json['book_pic']}",
      title: "${json['title']}",
      aboutBook: "${json['about_book']}",
      barCode: "${json['bar_code']}",
    );
  }

  Map toJson() => {
        "book_pic": bookPic,
        "title": title,
        "about_book": aboutBook,
        "bar_code": barCode,
      };
}
