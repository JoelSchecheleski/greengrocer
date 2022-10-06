import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _statusDot(
          isAtive: true,
          title: 'Pedido confirmado',
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _statusDot(
            isAtive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if(isOverdue) ...[
          const _statusDot(
            isAtive: true,
            title: 'Pagamento pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _statusDot(
            isAtive: currentStatus >= 2,
            title: 'Pagamento',
          ),
          const _CustomDivider(),
          _statusDot(
            isAtive: currentStatus >= 3,
            title: 'Preparado',
          ),
          const _CustomDivider(),
          _statusDot(
            isAtive: currentStatus >= 4,
            title: 'Envio',
          ),
          const _CustomDivider(),
          _statusDot(
            isAtive: currentStatus == 5,
            title: 'Entregue',
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _statusDot extends StatelessWidget {
  final bool isAtive;
  final String title;
  final Color? backgroundColor;

  const _statusDot({
    Key? key,
    required this.isAtive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isAtive ? backgroundColor ?? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isAtive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(width: 5),

        // Texto
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
