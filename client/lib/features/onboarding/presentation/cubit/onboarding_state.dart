part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final bool isLastPage;
  const OnboardingState({
    this.currentPage = 0,
    this.isLastPage = false,
  });

  copyWith({
    int? currentPage,
    bool? isLastPage,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props => [currentPage, isLastPage];
}
