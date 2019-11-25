// import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/actor_model.dart';

class ActoresProvider {

  Future<List<Actor>> getCast(String peliId) async {

    String _url = 'api.themoviedb.org';
    String _apikey = '472b3f9f5d461cb7c89998be7ac3abc7';
    String _language = 'es-ES';

    final url = Uri.https(_url,'3/movie/$peliId/credits',
        {'api_key': _apikey, 'language': _language});

    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);
 

    return cast.actores;

  }
}
