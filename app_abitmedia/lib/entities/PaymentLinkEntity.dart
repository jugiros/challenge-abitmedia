class PaymentLinkEntity {
  final bool integration;
  final int generateInvoice;
  final String description;
  final num amount;
  final num amountWithTax;
  final num amountWithoutTax;
  final num taxValue;
  final List<String> settings;

  PaymentLinkEntity(
      this.integration,
      this.generateInvoice,
      this.description,
      this.amount,
      this.amountWithTax,
      this.amountWithoutTax,
      this.taxValue,
      this.settings);

  factory PaymentLinkEntity.fromJson(dynamic json) {
    return PaymentLinkEntity(
        json['integration'] as bool,
        json['generate_invoice'] as int,
        json['description'] as String,
        json['amount'] as num,
        json['amount_with_tax'] as num,
        json['amount_without_tax'] as num,
        json['tax_value'] as num,
        json['settings']);
  }

  Map<String, dynamic> toJson() {
    return {
      'integration': integration,
      'generate_invoice': generateInvoice,
      'description': description,
      'amount': amount,
      'amount_with_tax': amountWithTax,
      'amount_without_tax': amountWithoutTax,
      'tax_value': taxValue,
      'settings': settings
    };
  }
}
