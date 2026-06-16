import 'dart:typed_data';
import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfReportService {

  static Future<Uint8List> generateFinancialReport({
    required List<TransactionModel> transactions,
    required String reportTitle,
  }) async {
    final pdf = pw.Document();
    final arabicFont = await PdfGoogleFonts.cairoRegular();
    final arabicFontBold = await PdfGoogleFonts.cairoBold();


    double totalIncome = 0;
    double totalExpense = 0;

    for (var tx in transactions) {
      if (tx.type == 'دخل' || tx.type == 'income') {
        totalIncome += tx.amount;
      } else {
        totalExpense += tx.amount;
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicFontBold),
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl, 
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    reportTitle,
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green900,
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text(
                    'تم التوليد بواسطة تطبيق أموالي - تاريخ: ${intl.DateFormat('yyyy/MM/dd').format(DateTime.now())}',
                    style: const pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.grey700,
                    ),
                  ),
                ),
                pw.Divider(thickness: 2, color: PdfColors.green700),
                pw.SizedBox(height: 20),

                pw.Container(
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey100,
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(color: PdfColors.grey300),
                  ),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                    children: [
                      pw.Column(
                        children: [
                          pw.Text(
                            'إجمالي الدخل',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            '${totalIncome.toStringAsFixed(2)} ل.س',
                            style: const pw.TextStyle(
                              fontSize: 14,
                              color: PdfColors.green700,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Text(
                            'إجمالي المصاريف',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            '${totalExpense.toStringAsFixed(2)} ل.س',
                            style: const pw.TextStyle(
                              fontSize: 14,
                              color: PdfColors.red700,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Text(
                            'الصافي',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            '${(totalIncome - totalExpense).toStringAsFixed(2)} ل.س',
                            style: pw.TextStyle(
                              fontSize: 14,
                              color: (totalIncome - totalExpense) >= 0
                                  ? PdfColors.green900
                                  : PdfColors.red900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 25),

                pw.Text(
                  'جدول المعاملات بالتفصيل:',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Table(
                  border: pw.TableBorder.all(
                    color: PdfColors.grey300,
                    width: 1,
                  ),
                  columnWidths: {
                    0: const pw.FlexColumnWidth(3), 
                    1: const pw.FlexColumnWidth(2), 
                    2: const pw.FlexColumnWidth(1.5), 
                    3: const pw.FlexColumnWidth(2), 
                  },
                  children: [
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.green700,
                      ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Center(
                            child: pw.Text(
                              'العنوان',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Center(
                            child: pw.Text(
                              'المبلغ',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Center(
                            child: pw.Text(
                              'النوع',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Center(
                            child: pw.Text(
                              'التاريخ',
                              style: pw.TextStyle(
                                color: PdfColors.white,
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  
                    ...transactions.map((tx) {
                      final isIncome = tx.type == 'دخل' || tx.type == 'income';
                      return pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(6),
                            child: pw.Text(
                              tx.title,
                              style: const pw.TextStyle(fontSize: 11),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(6),
                            child: pw.Center(
                              child: pw.Text(
                                '${tx.amount.toStringAsFixed(0)} ل.س',
                                style: const pw.TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(6),
                            child: pw.Center(
                              child: pw.Text(
                                isIncome ? 'دخل' : 'مصروف',
                                style: pw.TextStyle(
                                  fontSize: 11,
                                  color: isIncome
                                      ? PdfColors.green
                                      : PdfColors.red,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(6),
                            child: pw.Center(
                              child: pw.Text(
                                intl.DateFormat('yyyy/MM/dd').format(tx.date),
                                style: const pw.TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}
