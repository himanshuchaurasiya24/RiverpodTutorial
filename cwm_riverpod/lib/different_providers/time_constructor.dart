class TimeConstructor {
  int? dayofweek;
  String? dayofweekName;
  int? day;
  int? month;
  String? monthName;
  int? year;
  int? hours;
  int? minutes;
  int? seconds;
  int? millis;
  String? fulldate;
  String? timezone;
  String? status;

  TimeConstructor(
      {this.dayofweek,
      this.dayofweekName,
      this.day,
      this.month,
      this.monthName,
      this.year,
      this.hours,
      this.minutes,
      this.seconds,
      this.millis,
      this.fulldate,
      this.timezone,
      this.status});

  TimeConstructor.fromJson(Map<String, dynamic> json) {
    dayofweek = json['dayofweek'];
    dayofweekName = json['dayofweekName'];
    day = json['day'];
    month = json['month'];
    monthName = json['monthName'];
    year = json['year'];
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    millis = json['millis'];
    fulldate = json['fulldate'];
    timezone = json['timezone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dayofweek'] = dayofweek;
    data['dayofweekName'] = dayofweekName;
    data['day'] = day;
    data['month'] = month;
    data['monthName'] = monthName;
    data['year'] = year;
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    data['millis'] = millis;
    data['fulldate'] = fulldate;
    data['timezone'] = timezone;
    data['status'] = status;
    return data;
  }
}
