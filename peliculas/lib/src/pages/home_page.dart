import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

PeliculaProvider peliculaProvider = new PeliculaProvider();

  @override
  Widget build(BuildContext context) {

    peliculaProvider.getPopulares();
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cine'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          mainAxisAlignment : MainAxisAlignment.spaceAround,
          child: Column(
            children: <Widget>[
              _swiperTarjetas(),
              _footer(context),
              ],
          ),
        ));
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
    future: PeliculaProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
     
        if (snapshot.hasData) {
          return CardSwisper(peliculas:snapshot.data);
        } else {
            return Container(
            heigth:400.0,
              child:Center(
                child:CircularProgreddIndicator()
              )
            );
        }

      },
    ),

  }
  Widget _footer(context) {

    return  Container(

      width:double.infinity,
      child:Column(

      crossAxisAlignment:CrossAxisAlignment.start,
        children:<Widget>[
          Container(
          padding:EdgeInsert.only(left:20.0),
          child:Text('Populares',style:Theme.of(context).textTheme.subHead),

          ),
         SizeBox(height:5.0),
         StreamBuilder(
           stream: PeliculaProvider.popularesStream,
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return MovieHorizontal(
                peliculas:snapshot.data,
                siguientePagina:peliculaProvider.getPopulares,
              );
            }
            else{
              return Center (
               child: CircularProgressIndicator();
              );
            }
           },
         ),
       ],
      ),
    );
  }
}
