// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

Set<String> globalInterestsSet = {};

class EventDetailsModel {
  EventDetailsModel(
      {required this.id,
      required this.name,
      required this.date,
      required this.time,
      required this.venue,
      required this.organizers,
      required this.mcs,
      required this.guests,
      required this.description,
      required this.age_restriction,
      required this.organizer,
      required this.cover_image});

  final String id;
  final String name;
  final String date;
  final String time;
  final String venue;
  final String organizers;
  final String mcs;
  final String guests;
  final String description;
  final bool age_restriction;
  final String organizer;
  final String cover_image;
}

List<EventDetailsModel> Details = [
  EventDetailsModel(
      id: 'dfghjk563fg',
      name: 'DezzzzNutssss',
      date: '07 AUGUST 2022',
      time: '10:00pm GMT',
      venue: "A110",
      organizers: 'Beanzz Logoszn',
      mcs: 'Pyro, Geeeee',
      guests: 'None',
      description:
          'This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.This is where the description is displayed. The content of this space is given by the organizer of the event '
          'on the web form and then it is put here after it has been fetched from the backend by the api'
          'Over here I just realised we did not limit the user as to how many words they should use here.',
      age_restriction: true,
      organizer: 'OP man',
      cover_image:
          'https://i.pinimg.com/564x/54/36/0b/54360bafe2f942fdeedce7a33ba11f7d.jpg')
];

class EventFlyerURLs {
  EventFlyerURLs({required this.urls});

  final String urls;
}

List<EventFlyerURLs> FlyerURLs = [
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/54/36/0b/54360bafe2f942fdeedce7a33ba11f7d.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
  EventFlyerURLs(
      urls:
          'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg')
];

//This class is just for testing ui
