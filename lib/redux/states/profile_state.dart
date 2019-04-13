import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/profile_info.dart';

@immutable
class ProfileState {
  final ProfileVo profile;

  ProfileState({this.profile});

  ProfileState copyWith({ProfileVo profile}) {
    return ProfileState(profile: profile ?? this.profile);
  }

  ProfileState.initialState() : profile = ProfileVo.initialState();
}
