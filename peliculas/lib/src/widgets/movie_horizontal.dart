import 'package:flutter/material.dart';

class MovieHorizontal extends StatelessWidget {

final List<Pelicula> peliculas ;
final Function siguientePagina;

MovieHorizontal({@required this.peliculas,@required this.siguientePagina})
final _pageController = new PageController(
initialPage:1,
viewportFraction:0.3
);

  @override
  Widget build(BuildContext context) {
    
    final _screensize = MediaQuery.of(context).size;
_pageController.addListener((){

if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200)  {
 siguientePagina(); 
}

});

    return Container(
    height : _screensize.height = 0.2,
    child: PageView.builder(
    pageSnapping:false,
    controller:_pageController,
    itemCount:peliculas.length,
    itemBuilder:(context,i){
    return _tarjeta(context,peliculas[i]);
      },
    ),
  );
}

  Widget _tarjeta(BuildContext context , Pelicula pelicula){

    final tarjeta = Container(

        margin : EdgeInserts.only(right:15.0),
        child:Column(
          children;<Widget>[
            ClipRRect(
              FadeInImage(
                    image:NetworkImage(peliculas.getPosterImg()),
                    placeholder:AssetImage('assets/img/no-image.jpg'),
                    fit:BoxFit.cover,
                    height:160.0,
              ),
            )
            SizedBox(height:5.0),
            Text(
            pelicula.title,
            overflow:TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

    return GestureDeterctor(
      child:tarjeta,
      onTap:(){

        Navigator.pushName(context,'detalle',argument:pelicula);
      },
    );

  }

  List<Widget>_tarjetas(BuildContext context){

    return peliculas.map((pelicula){

      return Container(

        margin : EdgeInserts.only(right:15.0),
        child:Column(
          children;<Widget>[
            ClipRRect(
              FadeInImage(
                    image:NetworkImage(peliculas.getPosterImg()),
                    placeholder:AssetImage('assets/img/no-image.jpg'),
                    fit:BoxFit.cover,
                    height:160.0,
              ),
            )
            SizedBox(height:5.0),
            Text(
            pelicula.title,
            overflow:TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.caption,

            )
          ],
            
        ),

      );
    }).toList();
  }
}