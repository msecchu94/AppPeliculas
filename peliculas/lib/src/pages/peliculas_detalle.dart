import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context)-setting.arguments;
    
    return Scaffols(
     body:CustomScrollView(
       slivers: <Widget>[
        _crarAppbar(pelicula),
        SliverList(
          delegate:SliverChildListDelegate(
          SizedBox(height:10.0),  
          _posterTitulo(pelicula),
          _descripcion(pelicula),
          _descripcion(pelicula),
          _descripcion(pelicula),
          _descripcion(pelicula),
          ),
        )
       ],
     )
    );
  }
  Windget _crarAppbar(Pelicula pelicula){
    return SliverAppBar(
      elevation:2.0,
      backgroundColor:Colors.indigoAccent,
      expandedHeight:200,
      floating:false,
      pinned:true,
      flexibleSpace:FlexibleSpaceBar(
        centerTitle:true,
        title:Text(
          pelicula.title
          style:TextStyle(color:Colors.white,fontSize:16.0),
        ),
        backgroundColor:FadeInImage(
          image:NetworkImage(pelicula.getBackgroundImg()),
          placeholder:AssetImage('assets/img/loading.gif'),
          fadeInDuration;Duration(microseconds:150),
          fit:BoxFit.cover,
        ),
      ),
    );
  }

  Winget _posterTitulo(BuildContext context,Pelicula pelicula){
    return Container(
      padding:EdgeInserts.symetric(horizontal:20.0),
      child:Row(
        children:<Widget>[
          ClipRRect(
            borderRadius:BordserRadius.circular(20.0),
            child:Image(
              image:NetworkImage(pelicula.getPosterImg()),
              height:150.0
            ) 
          ),
          SizeBox(width:20.0),
          Flexible(
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:<Widget>[
                  Text(pelicula.title,style:Theme.of(context).textTheme.title,overflow:TextOverflow.ellipsis),
                  Text(pelicula.originalTitle,style:Theme.of(context).textTheme.subhead,overflow:TextOverflow.ellipsis),
                  Row(
                    children:<Widget>[
                      Icon:(Icons.star_border),
                      Text(pelicula.voteAverage.toString(),style:Theme.of(context).textTheme.subhead)
                    ],
                  ),
                ],
              ),
          )   
        ],
      ),
    );
  }

  Winget _descripcion(Pelicula pelicula){

      return Container(
        padding:EdgeInsets.symmetric(horizontal:10.0,vertical:20.0),
        pelicula.overview,
        textAlign:TextAling.justify,  
      ),
    );
  }
}