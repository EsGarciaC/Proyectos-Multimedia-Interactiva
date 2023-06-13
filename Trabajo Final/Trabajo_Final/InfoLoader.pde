//Supongo que aquí puede ir todo el codigo para cargar la info

//Se ingresan las canciones e imagenes a sus respectivos HashMap
void loadDeptCancion(String dept){
    //if (dept.equals("Antioquia"))
    enciclopediaCanciones.put(dept, minim.loadFile("Canciones/" + dept + ".mp3", 1024));
}


AudioPlayer reproducirCancion(){
  AudioPlayer currentCancion = enciclopediaCanciones.get(currentDept);
  AudioPlayer lastCancion;
  if (!lastDept.equals(currentDept)){
      //currentCancion = enciclopediaCanciones.get(currentDept);
      lastCancion = enciclopediaCanciones.get(lastDept);
      if(!lastDept.equals("")){
        lastCancion.pause();
        lastCancion.rewind();
      }
      if (!currentDept.equals("")){
        currentCancion.rewind();
        currentCancion.play();
        paused = false;
      }
  }
  return currentCancion;
}

void loadDeptImagen(String dept){
    enciclopediaImagenes.put(dept, loadImage("Imagenes/" + dept + ".jpg"));
}
