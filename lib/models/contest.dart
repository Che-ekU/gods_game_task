class ContestSchema {
  ContestSchema({
    required this.id,
    required this.teamName,
    required this.fillingFast,
    required this.entryFee,
    required this.discountedEntryFee,
    required this.totalPrize,
    required this.firstPrize,
    required this.winnerCount,
    required this.maxPermittedSpots,
    required this.type,
    required this.rewardType,
    required this.totalSpots,
    required this.availableSpots,
  });

  final String id;
  final String teamName;
  final bool fillingFast;
  final int entryFee;
  final int discountedEntryFee;
  final String totalPrize;
  final int firstPrize;
  final int winnerCount;
  final int maxPermittedSpots;
  final String type;
  final String rewardType;
  final int totalSpots;
  final int availableSpots;
}
