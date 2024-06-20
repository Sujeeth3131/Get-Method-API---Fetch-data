class IPinfo {
  String? ip;
  String? city;
  String? region;
  String? country;
  String? loc;
  String? org;
  String? postal;
  String? timezone;
  String? readme;

  IPinfo(
      {this.ip,
        this.city,
        this.region,
        this.country,
        this.loc,
        this.org,
        this.postal,
        this.timezone,
        this.readme});

  IPinfo.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    city = json['city'];
    region = json['region'];
    country = json['country'];
    loc = json['loc'];
    org = json['org'];
    postal = json['postal'];
    timezone = json['timezone'];
    readme = json['readme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['city'] = this.city;
    data['region'] = this.region;
    data['country'] = this.country;
    data['loc'] = this.loc;
    data['org'] = this.org;
    data['postal'] = this.postal;
    data['timezone'] = this.timezone;
    data['readme'] = this.readme;
    return data;
  }
}