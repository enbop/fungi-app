class ServiceListEntryOrder implements Comparable<ServiceListEntryOrder> {
  const ServiceListEntryOrder({
    required this.reference,
    required this.stableId,
  });

  final String reference;
  final String stableId;

  @override
  int compareTo(ServiceListEntryOrder other) {
    final referenceComparison = reference.trim().toLowerCase().compareTo(
      other.reference.trim().toLowerCase(),
    );
    if (referenceComparison != 0) {
      return referenceComparison;
    }

    final exactReferenceComparison = reference.compareTo(other.reference);
    if (exactReferenceComparison != 0) {
      return exactReferenceComparison;
    }

    return stableId.compareTo(other.stableId);
  }
}
