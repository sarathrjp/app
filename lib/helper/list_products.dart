import 'package:cloud_firestore/cloud_firestore.dart';

class Medicines {
  String? Id;
  String? Medicine_Name;
  String? Medicine_Description;
  double? Quantity;
  double? Amount;

  Medicines({
    this.Id,
    this.Medicine_Name,
    this.Medicine_Description,
    this.Quantity,
    this.Amount,
});
  dynamic toJson() => {
    'Id': Id,
    'Medicine_Name': Medicine_Name,
    'Medicine_Description': Medicine_Description,
    'Quantity': Quantity,
    'Amount': Amount,
  };
  factory Medicines.fromJson(Map<String, dynamic> json) {
    return Medicines(
      Id: json['Id'],
      Medicine_Name: json['Medicine_Name'],
      Medicine_Description: json['Medicine_Description'],
      Quantity: json['Quantity'],
    );
  }
}

List<Medicines> med =[
  Medicines(Id: '1', Medicine_Name: 'Paracetamol', Medicine_Description: 'Treat Pain and Reduce High Temperature',Quantity: 25, Amount: 20),
  Medicines(Id: '2', Medicine_Name: 'Repace', Medicine_Description: 'Treat High Blood Pressure',Quantity: 20, Amount: 25),
  Medicines(Id: '3', Medicine_Name: 'Gemer', Medicine_Description: 'Treatment of Type 2 Diabetes Mellitus',Quantity: 23, Amount: 55),
  Medicines(Id: '4', Medicine_Name: 'Limci', Medicine_Description: 'Vitamin C tablets',Quantity: 28, Amount: 35),
  Medicines(Id: '5', Medicine_Name: 'Ondem', Medicine_Description: 'Treat vomiting sensations',Quantity: 28, Amount: 45),
  Medicines(Id: '6', Medicine_Name: 'Lupsilin', Medicine_Description: 'Insulin Injection to treat sugar',Quantity: 12, Amount: 100),
  Medicines(Id: '7', Medicine_Name: 'Stodil', Medicine_Description: 'Used for treatment of diarrhoea',Quantity: 15, Amount: 15),
  Medicines(Id: '8', Medicine_Name: 'Brozodex', Medicine_Description: 'Syrup for Bronchyl Cough',Quantity: 18, Amount: 85),
  Medicines(Id: '9', Medicine_Name: 'Restyl', Medicine_Description: 'Sedative Used for treating anxiety',Quantity: 17, Amount: 22),
  Medicines(Id: '10', Medicine_Name: 'Pantoprozole', Medicine_Description: 'Antacid used for treating gastritis',Quantity: 27, Amount: 75),

];

Future<void> uploadMedToFirebase(List<Medicines> med) async {
  for(Medicines Med in med) {
    await FirebaseFirestore.instance.collection('Medicines').doc(Med.Id)
        .set(Med.toJson());
  }
}