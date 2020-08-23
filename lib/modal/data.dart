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
  factory People.fromJson(Map data){
    return People(
      id: data['id']!=null?data['id']:'no id',
      name: data['name'],
      gender: data['gender'],
      dob: data['dob'],
      height: data['height'] ,
      weight: data['weight'] ,
      email: data['email'],
      phoneNumber: data['phone']
    );
  }

  String calculateBmi(){
     return (weight/(height*height*0.01*0.01)).toStringAsFixed(2);
  }
  double calculateAge(){
    return (DateTime.now().difference(dob).inHours) /8760;
  }
}

class Couple{
  List<People> couple;
  DateTime bleedingDate;
  String cycleDay;

  Couple({
    this.couple,
    this.bleedingDate,
    this.cycleDay
  });

  factory Couple.fromJson(Map<String,dynamic> data){
    return Couple(
      couple: data['couple'],
      bleedingDate: data['bleedingDate'],
      cycleDay: data['cycleDay'],
    );
  }

  // void addCoupleData(List<People> cop,DateTime bleedDate, String cycleDay){
  //   Couple(

  //   );
  //   this.couple = cop;
  //   this.bleedingDate = bleedDate;
  //   this.cycleDay = cycleDay;
    
  // }

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
       cycleDay: '25',
     ); 
  }
}