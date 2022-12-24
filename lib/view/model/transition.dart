class Transiction {
  final bool transictionType;
  final String title;
  final String emissor;
  final String amountTransiction;
  final String transictionImageUrl ;

  Transiction({
      required this.title,
      required this.amountTransiction,
      required this.emissor,
      this.transictionType = false,
      required this.transictionImageUrl
  });

}
