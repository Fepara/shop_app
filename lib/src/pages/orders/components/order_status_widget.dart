import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refuned': 1,
    'checking paid': 2,
    'paid': 3,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: 'Pedido Realizado',
        ),
        const _CustomDivinder(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Verificando pagamento',
          ),
          const _CustomDivinder(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Pagamento aprovado',
          )
        ]
      ],
    );
  }
}

class _CustomDivinder extends StatelessWidget {
  const _CustomDivinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
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
              color: Colors.purple,
            ),
            color:
                isActive ? backgroundColor ?? Colors.green : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(
          width: 5,
        ),

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
