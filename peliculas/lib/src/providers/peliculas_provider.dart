import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';



class PeliculaProvider {
  String _apikey   = '472b3f9f5d461cb7c89998be7ac3abc7';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando     = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function (List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream (String) get popularesStream => _popularesStreamController.stream;

  void disposeStream(){
   _popularesStreamController?.close(); 
  } 

  Future<List><Pelicula>> _ProcesarRespuesta(Uri url)async{

  final res = await http.get(url);
  final  decodedData = json.decode(res.body);

  final peliculas = new Peliculas.fromJsonList(decodedData['results']);

  return peliculas.items;

  }

}

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',{'api_key': _apikey, 'language': _language});

    return await _ProcesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {

  if (_cargando) return [];
  _cargando = true;
    

 _populares++;

  final url = Uri.https(_url,'3/movie/popular',{'api_key':_apikey,'language':_language.'page':_popularesPage.toString()});

  final res = await _ProcesarRespuesta(url);

  _populares.addAll(res);

  popularesSink(_populares);

  _cargando = false;

  return res;

 }
}
