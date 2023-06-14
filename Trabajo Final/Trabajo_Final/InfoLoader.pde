//Se ingresan las canciones e imagenes a sus respectivos HashMap
void loadDeptCancion(String dept){
    //if (dept.equals("Antioquia"))
    enciclopediaCanciones.put(dept, minim.loadFile("Canciones/" + dept + ".mp3", 1024));
}


AudioPlayer reproducirCancion(){
  AudioPlayer currentCancion = enciclopediaCanciones.get(currentDept);
  AudioPlayer lastCancion;
  if (!lastDept.equals(currentDept)){ // Si hay un cambio de departamento pausar la canción actual
      //currentCancion = enciclopediaCanciones.get(currentDept);
      lastCancion = enciclopediaCanciones.get(lastDept);
      if(!lastDept.equals("")){
        lastCancion.pause();
        lastCancion.rewind();
      }
      if (!currentDept.equals("")){ // Reproducir canción actual
        currentCancion.rewind();
        currentCancion.play();
        paused = false;
      }
  }
  return currentCancion;
}

// Ingresar imagen en el Hashmap de imagenes
void loadDeptImagen(String dept){
    enciclopediaImagenes.put(dept, loadImage("Imagenes/" + dept + ".jpg"));
}
