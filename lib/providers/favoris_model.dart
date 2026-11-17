import 'package:flutter/foundation.dart';
import '../models/destination.dart';

class FavorisModel extends ChangeNotifier{
	final Map<String, Destination> favoris = {};

	List<Destination> get liste => List.unmodifiable(favoris.values);

	int get nombre => favoris.length;

	bool estFavori(Destination d) => favoris.containsKey(d.id);

	bool basculer(Destination d) {
		if (estFavori(d)) {
			favoris.remove(d.id);
			notifyListeners();
			return false;
		}

		favoris[d.id] = d;
		notifyListeners();
		return true;
	}
}