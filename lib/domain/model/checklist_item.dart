class CheckListItem{
  final bool? checked;
  final String? text;
  final String? id;

  CheckListItem({this.checked, this.text, this.id});

  CheckListItem copyWith({
    bool? checked,
    String? text,
    String? id,
  }) {
    return CheckListItem(
      checked: checked ?? this.checked,
      text: text ?? this.text,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checked': checked,
      'text': text,
      'id': id,
    };
  }

  factory CheckListItem.fromJson(Map<String, dynamic> json) {
    return CheckListItem(
      checked: json['checked'],
      text: json['text'],
      id: json['id'],
    );
  }
}