import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ConsultationResultsScreen extends StatelessWidget {
  final String animalName;
  final String animalType;
  final DateTime consultationDate;
  final String consultationDetails;
  final String veterinaryDiagnosis;
  final String prescribedTreatment;

  ConsultationResultsScreen({
    required this.animalName,
    required this.animalType,
    required this.consultationDate,
    required this.consultationDetails,
    required this.veterinaryDiagnosis,
    required this.prescribedTreatment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(
            title: 'Veterinary Consultation Results',
            color: Color4,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: text(
                title: 'Animal Name:',
                fontSize: 20,
                color: Color4,
                fontWeight: FontWeight.bold,
              ),
              subtitle: text(title: animalName, fontSize: 16, color: Color4),
            ),
            ListTile(
              title: text(
                  title: 'Animal Type:',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color4),
              subtitle: text(
                title: animalType,
                color: Color4,
                fontSize: 16,
              ),
            ),
            ListTile(
              title: text(
                title: 'Consultation Date:',
                fontSize: 20,
                color: Color4,
                fontWeight: FontWeight.bold,
              ),
              subtitle: text(
                  title: consultationDate.toString(),
                  fontSize: 16,
                  color: Color4),
            ),
            SizedBox(height: 20),
            text(
              title: 'Consultation Details:',
              color: Color4,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(225, 239, 100, 61)),
                child: text(
                    title: consultationDetails, fontSize: 18, color: Color3)),
            SizedBox(height: 20),
            text(
                title: 'Veterinary Diagnosis:',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color4),
            Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(225, 239, 100, 61)),
                child: text(
                    title: veterinaryDiagnosis, fontSize: 18, color: Color3)),
            SizedBox(height: 20),
            text(
              title: 'Prescribed Treatment:',
              fontSize: 20,
              color: Color4,
              fontWeight: FontWeight.bold,
            ),
            Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(225, 239, 100, 61)),
                child: text(
                    title: prescribedTreatment, fontSize: 18, color: Color3)),
          ],
        ),
      ),
    );
  }
}
