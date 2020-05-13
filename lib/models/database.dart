
class Database {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  Database(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  Database.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['lastRefreshed'] = this.lastRefreshed;
    data['lastOriginUpdate'] = this.lastOriginUpdate;
    return data;
  }
}

class Data {
  String source;
  String lastRefreshed;
  Total total;
  List<Statewise> statewise;

  Data({this.source, this.lastRefreshed, this.total, this.statewise});

  Data.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    lastRefreshed = json['lastRefreshed'];
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['lastRefreshed'] = this.lastRefreshed;
    if (this.total != null) {
      data['total'] = this.total.toJson();
    }
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Total {
  int confirmed;
  int recovered;
  int deaths;
  int active;

  Total({this.confirmed, this.recovered, this.deaths, this.active});

  Total.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['deaths'] = this.deaths;
    data['active'] = this.active;
    return data;
  }
}

class Statewise {
  String state;
  int confirmed;
  int recovered;
  int deaths;
  int active;

  Statewise(
      {this.state, this.confirmed, this.recovered, this.deaths, this.active});

  Statewise.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['deaths'] = this.deaths;
    data['active'] = this.active;
    return data;
  }
}