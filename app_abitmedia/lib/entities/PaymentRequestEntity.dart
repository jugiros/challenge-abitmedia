class Third {
  final String document;
  final String documentType;
  final String name;
  final String email;
  final String phones;
  final String address;
  final String type;

  Third(this.document, this.documentType, this.name, this.email, this.phones,
      this.address, this.type);

  factory Third.fromJson(dynamic json) {
    return Third(
        json['document'] as String,
        json['document_type'] as String,
        json['name'] as String,
        json['email'] as String,
        json['phones'] as String,
        json['address'] as String,
        json['type'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'document': document,
      'document_type': documentType,
      'name': name,
      'email': email,
      'phones': phones,
      'address': address,
      'type': type
    };
  }
}

class PaymentRequestEntity {
  final bool integration;
  final Third third;
  final int generateInvoice;
  final String description;
  final num amount;
  final num amountWithTax;
  final num amountWithoutTax;
  final num taxValue;
  final String? notifyUrl;
  final String? customValue;
  final int hasCash;
  final int hasCards;

  PaymentRequestEntity(
      this.integration,
      this.third,
      this.generateInvoice,
      this.description,
      this.amount,
      this.amountWithTax,
      this.amountWithoutTax,
      this.taxValue,
      this.notifyUrl,
      this.customValue,
      this.hasCash,
      this.hasCards);

  factory PaymentRequestEntity.fromJson(dynamic json) {
    return PaymentRequestEntity(
        json['integration'] as bool,
        json['third'] as Third,
        json['generate_invoice'] as int,
        json['description'] as String,
        json['amount'] as num,
        json['amount_with_tax'] as num,
        json['amount_without_tax'] as num,
        json['tax_value'] as num,
        json['notify_url'] as String,
        json['custom_value'] as String,
        json['has_cash'] as int,
        json['has_cards'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'integration': integration,
      'third': third.toJson(),
      'generate_invoice': generateInvoice,
      'description': description,
      'amount': amount,
      'amount_with_tax': amountWithTax,
      'amount_without_tax': amountWithoutTax,
      'tax_value': taxValue,
      'notify_url': notifyUrl,
      'custom_value': customValue,
      'has_cash': hasCash,
      'has_cards': hasCards
    };
  }
}
