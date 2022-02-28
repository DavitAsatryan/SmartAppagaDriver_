part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object> get props => [];
}

class ProfileEditButtonPressed extends ProfileEditEvent {
  final String imagePath;
  final String fullName;
  final List<ProfileNumbers> phones;

  final List<ProfileCarData> cars;
  bool isOne;
  bool isTwo;
  bool isThree;
  bool isFour;

  ProfileEditButtonPressed(
      {required this.imagePath,
      required this.fullName,
      required this.phones,
      required this.cars,
      required this.isOne,
      required this.isTwo,
      required this.isThree,
      required this.isFour});

  @override
  List<Object> get props =>
      [imagePath, fullName, phones, cars, isOne, isTwo, isThree, isFour];

  @override
  String toString() =>
      'ProfileEditButtonPressed {imagePAth: $imagePath fullName: $fullName, Phone: $phones, : $cars oneBool: $isOne , twoBool: $isTwo , threeBoll: $isThree , fourBoll: $isFour }';
}
