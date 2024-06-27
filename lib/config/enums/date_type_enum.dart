


enum DateTypeEnum {
  Today('Today'),
  Yesterday('Yesterday'),
  ThisWeek('This Week'),
  Custom('Custom');

  const DateTypeEnum(this.value);

  final String value;
}