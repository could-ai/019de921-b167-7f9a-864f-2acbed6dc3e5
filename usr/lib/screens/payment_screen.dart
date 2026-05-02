import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Card';

  void _processPayment() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Confirmed'),
        content: Text(_selectedPaymentMethod == 'Card'
            ? 'Your card payment of \$150.00 was successful.'
            : 'Please pay \$150.00 at the clinic reception.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Payments'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bill Summary
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Outstanding Balance',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$150.00',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Consultation Fee'),
                        Text('\$100.00'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Lab Tests'),
                        Text('\$50.00'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Methods
            Text(
              'Select Payment Method',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Card Option
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedPaymentMethod == 'Card'
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300]!,
                  width: _selectedPaymentMethod == 'Card' ? 2 : 1,
                ),
              ),
              child: RadioListTile(
                value: 'Card',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
                title: const Text('Credit / Debit Card'),
                subtitle: const Text('Pay securely online'),
                secondary: const Icon(Icons.credit_card, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 12),
            
            // Cash Option
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedPaymentMethod == 'Cash'
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300]!,
                  width: _selectedPaymentMethod == 'Cash' ? 2 : 1,
                ),
              ),
              child: RadioListTile(
                value: 'Cash',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
                title: const Text('Cash at Clinic'),
                subtitle: const Text('Pay directly at the reception'),
                secondary: const Icon(Icons.money, color: Colors.green),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Card Details Form (Show only if Card is selected)
            if (_selectedPaymentMethod == 'Card') ...[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  prefixIcon: Icon(Icons.credit_card),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Expiry (MM/YY)',
                        prefixIcon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        prefixIcon: Icon(Icons.security),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _processPayment,
                child: Text(
                  _selectedPaymentMethod == 'Card' ? 'Pay \$150.00 Now' : 'Confirm Cash Payment',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
