part of 'repeat_cubit.dart';

class RepeatState extends Equatable {
  final bool isRepeat;
  final ReleaseMode releaseMode;
  const RepeatState({
    this.isRepeat = false,
    this.releaseMode = ReleaseMode.stop,
  });

  @override
  List<Object> get props => [isRepeat, releaseMode];
}
