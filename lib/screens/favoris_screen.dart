import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/providers/favoris_model.dart';

import '../widgets/destination_card.dart';

class FavorisScreen extends StatelessWidget {
	const FavorisScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final model = context.watch<FavorisModel>();
		final favoris = model.liste;
		final nombre = model.nombre;

		if (favoris.isEmpty) {
			return Badge(
				isLabelVisible: nombre > 0,
				label: Text('$nombre'),
				child: const Center(
					child: Text('Aucun favori pour le moment'),
				),
			);
		}

		return Badge(
			isLabelVisible: nombre > 0,
			label: Text('$nombre'),
			child: Padding(
				padding: const EdgeInsets.all(8.0),
				child: ListView.builder(
					itemCount: favoris.length,
					itemBuilder: (context, index) => DestinationCard(
						destination: favoris[index],
					),
				),
			),
		);
	}
}
