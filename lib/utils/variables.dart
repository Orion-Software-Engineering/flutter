// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

Set<String> globalInterestsSet = {};

class EventDetailsModel {
  final String id;

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
      date: '9099-20-4',
      time: '10:00',
      venue: "A110",
      organizers: 'Beanzz',
      mcs: 'Pyro, Geeeee, Hehe',
      guests: 'None',
      description: 'kdnfnadnflkanflkad jdlkf akdfakdjf lkadlfkj adf'
          'df akdjflkja dljf alkdjflk ajdfk jalkdj flkdajf lkajdlfk jadkfj ad'
          'fkla djfkj adkjfa dof;hfadifhajdknk fhdnkds p  d '
          ' dhfoi akdhfiadjf oiajdf ioajdfoidhfoadoif jaoidg oi goir oiskadv'
          'oivsdlkv jdo vdpov kad;vk ;do k opdvkapdvkapdova po;',
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
enum MessageType { text, image }

class ChatListModel {
  final String name;
  final String lastMessage;
  final String? lastMessageTime;
  final int? numberOfUnreads;
  final MessageType? lastMessageType;
  final bool sent;
  final String? chatId;

  ChatListModel(
      {required this.name,
      required this.lastMessage,
      this.lastMessageTime,
      this.numberOfUnreads,
      this.lastMessageType,
      required this.sent,
      this.chatId});
}

List<ChatListModel> chatList = [
  ChatListModel(
      name: "Joan Louji",
      lastMessage: "Hey dude, What's up",
      lastMessageTime: "1.34 PM",
      numberOfUnreads: 0,
      sent: true,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Tony",
      lastMessage: "5.02",
      lastMessageTime: "10.00 AM",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Stark",
      lastMessage: "Wassup !",
      lastMessageTime: "5:00",
      numberOfUnreads: 1,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Rachel",
      lastMessage: "Love you",
      lastMessageTime: "8:39 AM",
      numberOfUnreads: 0,
      sent: true,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Captain",
      lastMessage: "1.02",
      lastMessageTime: "8: 00 AM",
      numberOfUnreads: 4,
      sent: false,
      lastMessageType: MessageType.image),
  ChatListModel(
      name: "Joe",
      lastMessage: "Flutter Demo",
      lastMessageTime: "6 AM",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Richie",
      lastMessage: "Hey Joan, How do you do?",
      lastMessageTime: "4 AM",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Vikadan",
      lastMessage: "I want to learn flutter. Can I get help from you?",
      lastMessageTime: "yesterday",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.image),
  ChatListModel(
      name: "India",
      lastMessage: "Hey Joan, got a message. ",
      lastMessageTime: "yesterday",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Vijay",
      lastMessage: "I am your bug fan",
      lastMessageTime: "yesterday",
      numberOfUnreads: 0,
      sent: true,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Louji",
      lastMessage: "4.00",
      lastMessageTime: "yesterday",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.image),
  ChatListModel(
      name: "Joan",
      lastMessage: "politics",
      lastMessageTime: "yesterday",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Rion",
      lastMessage: "How are you?",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Johanna",
      lastMessage: "Hey whats up",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 12,
      sent: true,
      lastMessageType: MessageType.image),
  ChatListModel(
      name: "Isac",
      lastMessage: "May god bless you.",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 0,
      sent: true,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Ibrahim",
      lastMessage: "Who are you",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 3,
      sent: true,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Edwin",
      lastMessage: "Let's play a match now",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Rachel",
      lastMessage: "lot's of showers",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Rani",
      lastMessage: "hey there",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 32,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Prabu",
      lastMessage: "What about your job.",
      lastMessageTime: "22/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "EOP",
      lastMessage: "Wrong politics",
      lastMessageTime: "16/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Joshep",
      lastMessage: "Happy feast",
      lastMessageTime: "16/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Dart",
      lastMessage: "Happy coding..",
      lastMessageTime: "12/8/2020",
      numberOfUnreads: 0,
      sent: false,
      lastMessageType: MessageType.text),
  ChatListModel(
      name: "Java",
      lastMessage: "00.32",
      lastMessageTime: "16/8/2020",
      numberOfUnreads: 53,
      sent: true,
      lastMessageType: MessageType.image),
];

class PossibleMatchCard {
  PossibleMatchCard({required this.name, required this.about});

  final String name;
  final String about;
}

List<PossibleMatchCard> PossibleMatches = [
  PossibleMatchCard(name: "Sarah", about: "Nkay typed something here"),
  PossibleMatchCard(name: "James", about: "Nkay typed something here"),
  PossibleMatchCard(name: "Nessa", about: "Nkay typed something here"),
  PossibleMatchCard(name: "Jack", about: "Nkay typed something here"),
  PossibleMatchCard(name: "Negus", about: "Nkay typed something here"),
  PossibleMatchCard(name: "Welp", about: "Nkay typed something here")
];
