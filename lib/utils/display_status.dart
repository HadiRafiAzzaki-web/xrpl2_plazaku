import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';

extension ProductStatusExtension on ProductStatus {
  String get displayName {
    switch (this) {
      case ProductStatus.all:
        return "All";
      case ProductStatus.pending:
        return "Pending";
      case ProductStatus.processed:
        return "Processed";
      case ProductStatus.sent:
        return "Sent";
      case ProductStatus.finish:
        return "Finish";
      case ProductStatus.rejected:
        return 'Rejected';
    }
  }

  Color? get backgroundColor {
    switch (this) {
      case ProductStatus.pending:
        return Color(0xFFFFF8E7);
      case ProductStatus.processed:
        return Color(0xFFEFF4FF);
      case ProductStatus.sent:
        return Color(0xFFEAFBF3);
      case ProductStatus.finish:
        return Color(0xFFFFFFFF);
      case ProductStatus.all:
        return Colors.white70;
      case ProductStatus.rejected:
        return Colors.red;
    }
  }
}
