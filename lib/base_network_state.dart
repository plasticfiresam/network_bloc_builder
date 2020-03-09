/// Base state which must be extended for Network/IO related views/pages/modules
/// ```dart
/// class HomeState extends BaseNetworkState {
///   final String name;
///
///   HomeState({
///     this.name,
///     bool isFetching = false,
///   }) : super(isFetching: isFetching);
/// }
/// ```
class BaseNetworkState {
  /// Boolean representative of fetching state
  final bool isFetching;

  BaseNetworkState({this.isFetching = false});
}
