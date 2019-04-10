import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/profile.dart';

@immutable
class ProfileState {
  final Profile profile;

  ProfileState({this.profile});

  ProfileState copyWith({Profile profile}) {
    return ProfileState(profile: profile ?? this.profile);
  }

  ProfileState.initialState() : profile = Profile.initialState();
}
