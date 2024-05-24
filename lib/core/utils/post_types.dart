/// Defines common post types used in the application.
///
/// This class provides static constants representing different types of posts
/// that can be used throughout the application. It cannot be instantiated.
final class PostType {
  PostType._();
  
  /// Represents a remote job post type.
  static const String remote = 'Remote';

  /// Represents an on-site job post type.
  static const String onsite = 'On-site';

  /// Represents a post type for buying time.
  static const String buyTym = 'Buy Tym';

  /// Represents a post type for selling time.
  static const String sellTym = 'Sell Tym';
}