// To parse this JSON data, do
//
//     final mockApiModel = mockApiModelFromJson(jsonString);

import 'dart:convert';

MockApiModel mockApiModelFromJson(String str) => MockApiModel.fromJson(json.decode(str));

String mockApiModelToJson(MockApiModel data) => json.encode(data.toJson());

class MockApiModel {
    final List<MockApiModelItem>? items;

    MockApiModel({
        this.items,
    });

    factory MockApiModel.fromJson(Map<String, dynamic> json) => MockApiModel(
        items: json["items"] == null ? [] : List<MockApiModelItem>.from(json["items"]!.map((x) => MockApiModelItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class MockApiModelItem {
    final OpenState? openState;
    final ClosedState? closedState;
    final String? ctaText;

    MockApiModelItem({
        this.openState,
        this.closedState,
        this.ctaText,
    });

    factory MockApiModelItem.fromJson(Map<String, dynamic> json) => MockApiModelItem(
        openState: json["open_state"] == null ? null : OpenState.fromJson(json["open_state"]),
        closedState: json["closed_state"] == null ? null : ClosedState.fromJson(json["closed_state"]),
        ctaText: json["cta_text"],
    );

    Map<String, dynamic> toJson() => {
        "open_state": openState?.toJson(),
        "closed_state": closedState?.toJson(),
        "cta_text": ctaText,
    };
}

class ClosedState {
    final ClosedStateBody? body;

    ClosedState({
        this.body,
    });

    factory ClosedState.fromJson(Map<String, dynamic> json) => ClosedState(
        body: json["body"] == null ? null : ClosedStateBody.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "body": body?.toJson(),
    };
}

class ClosedStateBody {
    final String? key1;
    final String? key2;

    ClosedStateBody({
        this.key1,
        this.key2,
    });

    factory ClosedStateBody.fromJson(Map<String, dynamic> json) => ClosedStateBody(
        key1: json["key1"],
        key2: json["key2"],
    );

    Map<String, dynamic> toJson() => {
        "key1": key1,
        "key2": key2,
    };
}

class OpenState {
    final OpenStateBody? body;

    OpenState({
        this.body,
    });

    factory OpenState.fromJson(Map<String, dynamic> json) => OpenState(
        body: json["body"] == null ? null : OpenStateBody.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "body": body?.toJson(),
    };
}

class OpenStateBody {
    final String? title;
    final String? subtitle;
    final Card? card;
    final String? footer;
    final List<BodyItem>? items;

    OpenStateBody({
        this.title,
        this.subtitle,
        this.card,
        this.footer,
        this.items,
    });

    factory OpenStateBody.fromJson(Map<String, dynamic> json) => OpenStateBody(
        title: json["title"],
        subtitle: json["subtitle"],
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
        footer: json["footer"],
        items: json["items"] == null ? [] : List<BodyItem>.from(json["items"]!.map((x) => BodyItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "card": card?.toJson(),
        "footer": footer,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Card {
    final String? header;
    final String? description;
    final int? maxRange;
    final int? minRange;

    Card({
        this.header,
        this.description,
        this.maxRange,
        this.minRange,
    });

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        header: json["header"],
        description: json["description"],
        maxRange: json["max_range"],
        minRange: json["min_range"],
    );

    Map<String, dynamic> toJson() => {
        "header": header,
        "description": description,
        "max_range": maxRange,
        "min_range": minRange,
    };
}

class BodyItem {
    final String? emi;
    final String? duration;
    final String? title;
    final dynamic subtitle;
    final String? tag;
    final String? icon;

    BodyItem({
        this.emi,
        this.duration,
        this.title,
        this.subtitle,
        this.tag,
        this.icon,
    });

    factory BodyItem.fromJson(Map<String, dynamic> json) => BodyItem(
        emi: json["emi"],
        duration: json["duration"],
        title: json["title"],
        subtitle: json["subtitle"],
        tag: json["tag"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "emi": emi,
        "duration": duration,
        "title": title,
        "subtitle": subtitle,
        "tag": tag,
        "icon": icon,
    };
}
