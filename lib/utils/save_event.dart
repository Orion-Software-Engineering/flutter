import 'package:shared_preferences/shared_preferences.dart';
import '../models/events_model.dart';

Future<void> saveEvent(Event event) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  // get existing string list
  List<String>? savedEvents = pref.getStringList('saved_events');
  List<String> eventsToSave = <String>[];

  if (savedEvents == null || savedEvents.isEmpty) {
    // set string list without worry
    eventsToSave.add(event.id);
    pref.setStringList('saved_events', eventsToSave);
  } else {
    // we need to keep current list and add the new item
    eventsToSave = savedEvents;
    // let's see if the event is already saved, then we remove, else add
    // check if already saved:
    if (eventsToSave.contains(event.id)) {
      // already saved, so remove event
    } else {
      // new save, add it
      eventsToSave.add(event.id);
    }
    pref.setStringList('saved_events', eventsToSave);
  }
}

Future<bool> isEventSaved(Event event) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> savedEvents = pref.getStringList('saved_events')!;
  if (savedEvents.isNotEmpty) {
    return savedEvents.contains(event.id);
  }
  return false;
}
