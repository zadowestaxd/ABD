var cursor = db.ultimasAventuras.find({ },{})

cursor.forEach( 
  function(item) 
      { print(tojson(item))  }
 );

 cursor.hasNext() // "false"  si ya no hay m�s elementos
cursor.hasNext() // "true" s todav�a quedan elementos por recorrer

