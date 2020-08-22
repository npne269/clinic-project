class People{
  String name;
  String gender;
  DateTime dob;
  double height;
  double weight;
  String id;
  String email;
  String phoneNumber;

  People({
    this.name,
    this.gender,
    this.dob,
    this.height,
    this.weight,
    this.email,
    this.id,
    this.phoneNumber,
  });

  String calculateBmi(){
     return (weight/(height*height)).toStringAsFixed(2);
  }
  double calculateAge(){
    return (DateTime.now().difference(dob).inHours) /8760;
  }
}

class Couple{
  List<People> couple;
  DateTime bleedingDate;
  DateTime cycleDay;

  Couple({
    this.couple,
    this.bleedingDate,
    this.cycleDay
  });

   getCoupleData(){
     return Couple(
       couple: [
         People(
           name: 'Bradley Cooper',
           height: 1.75,
           weight: 66,
           id: 'lololol',
           phoneNumber: '123456789',
           email: 'iam@male.com',
           gender: 'M',
           dob: DateTime(1999,12,06),
         ),
         People(
           name: 'Sccarlet Jhonsson',
           height: 1.75,
           weight: 66,
           id: 'lololol',
           phoneNumber: '123456789',
           email: 'iam@male.com',
           gender: 'F',
           dob: DateTime(1990,10,12),
         ),
       ],
       bleedingDate: DateTime(2019,10,12),
       cycleDay: DateTime(2019,10,12)
     ); 
  }
}