import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentHistoryAPI {
  static Future<List<Map<String, dynamic>>> getPaymentHistory() async {
    final url = Uri.parse('http://192.168.7.55/api/index.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Erreur lors de la récupération des données de paiement');
    }
  }
}
class Count {
  static Future<List<Map<String, dynamic>>> getPaymentHistory() async {
    final url = Uri.parse('http://192.168.7.55/api/notification.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Erreur lors de la récupération des données de paiement');
    }
  }
}

class PaiementsScreen extends StatefulWidget {
  @override
  _PaiementsScreenState createState() => _PaiementsScreenState();
}

class _PaiementsScreenState extends State<PaiementsScreen> {
  List<Map<String, dynamic>> paymentHistory = [];
List<Map<String, dynamic>> Count = [];
  @override
  void initState() {
    super.initState();
    _fetchPaymentHistory();
  }

   Future<void> _fetchPaymentHistory() async {
    try {
      final history = await PaymentHistoryAPI.getPaymentHistory();
      setState(() {
        paymentHistory = history;
      });
    } catch (e) {
      // Gérer les erreurs
      print('Erreur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique de paiement'),
      ),
      body: paymentHistory.isNotEmpty
          ? ListView.builder(
              itemCount: paymentHistory.length,
              itemBuilder: (context, index) {
                final payment = paymentHistory[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(76, 175, 80, 1).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Numéro de paiement: ${payment['pay_id']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text('Date: ${payment['datepaie']}'),
                          const SizedBox(height: 8.0),
                          Text('Montant payé: \$${payment['montant']}'),
                          const SizedBox(height: 8.0),
                          Text('Reste à payer: \$${payment['new_payments']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}