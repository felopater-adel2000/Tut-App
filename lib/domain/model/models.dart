import 'package:app/app/constants.dart';

class SliderObject
{
  String title;
  String subtitle;
  String image;

  SliderObject(this.title, this.subtitle, this.image);
}

class SliderViewObject
{
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}

//login models
class Customer
{
  String id;
  String name;
  int numOfNotification;

  Customer(this.id, this.name, this.numOfNotification);
}

class Contacts
{
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication
{
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}