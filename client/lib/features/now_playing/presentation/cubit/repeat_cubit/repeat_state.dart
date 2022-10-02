part of 'repeat_cubit.dart';

class RepeatState extends Equatable {
  final bool isRepeat;
  const RepeatState({required this.isRepeat});

  @override
  List<Object> get props => [isRepeat];
}
