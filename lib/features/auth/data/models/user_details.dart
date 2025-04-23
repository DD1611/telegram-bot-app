import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details.freezed.dart';
part 'user_details.g.dart';

@freezed
class PigeonUserDetails with _$PigeonUserDetails {
  const factory PigeonUserDetails({
    required String id,
    required String email,
    @Default('') String displayName,
    @Default('') String photoUrl,
  }) = _PigeonUserDetails;

  factory PigeonUserDetails.fromJson(Map<String, dynamic> json) =>
      _$PigeonUserDetailsFromJson(json);
}
