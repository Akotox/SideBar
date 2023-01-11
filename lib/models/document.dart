class Document {
  String? title;
  String? url;
  String? page_num;
  bool isRead = false;

  Document(this.title, this.isRead, this.url, this.page_num);

  static List<Document> doc_list = [

    Document(
      "Structure",
      false,
      "https://wiki.cac.washington.edu/download/attachments/7479159/cs2.pdf",
      "5",
      ),
      Document(
      "Structure",
      false,
      "https://wiki.cac.washington.edu/download/attachments/7479159/cs2.pdf",
      "5",
      ),

      Document(
      "Structure",
      false,
      "https://wiki.cac.washington.edu/download/attachments/7479159/cs2.pdf",
      "5",
      ),
  ];
}
