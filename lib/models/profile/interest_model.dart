class InterestCallModel {
  List<String> interests;
  InterestCallModel({required this.interests});

  Map<String, List<String>> toJson() {
    return {"interests": interests};
  }
}
