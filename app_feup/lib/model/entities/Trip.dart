class Trip{
  final String line;
  final String destination;
  final int timeRemaining;

  Trip({this.line, this.destination, this.timeRemaining});

  Map<String, dynamic> toMap() {
    return {
      'line': line,
      'destination': destination,
      'timeRemaining': timeRemaining
    };
  }

  void printTrip()
  {
    print('$line ($destination) - $timeRemaining');
  }

  int compare(Trip other) {
    return (timeRemaining.compareTo(other.timeRemaining));
  }
}