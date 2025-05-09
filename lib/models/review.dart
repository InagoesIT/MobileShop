class Review {
  final int id;
  final String firstName;
  final String lastName;
  final String message;
  final int rating;
  final String image;

  Review({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.message,
    required this.rating,
    required this.image,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      message: json['message'] ?? '',
      rating: json['rating'] ?? 5,
      image: json['image'] ?? '',
    );
  }
}
