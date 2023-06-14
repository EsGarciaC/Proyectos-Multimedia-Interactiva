color[] colores = {};
PShape dep;


//Se recibe el SVG del mapa de Colombia
void DesabilitarTodosLosEstilos(PShape pais){
  
  for(int i = 0; i < pais.getChildCount();i++){
    
    // Disable the colors found in the SVG file
    pais.getChild(i).disableStyle();
    // Scale to needed size
    pais.getChild(i).scale(1); // 150 %
    // random colors for all departments
    colores = append(colores, color(random(255),random(255),random(255)));
    loadDeptCancion(pais.getChild(i).getName());
    loadDeptImagen(pais.getChild(i).getName());
  }

}
// Asignar un color aleatorio a cada departamento
void ResaltarDepartamento(PShape pais){
    
    noStroke();
    for(int i = 0; i < pais.getChildCount();i++){
       dep = pais.getChild(i);
       fill(colores[i]);
       shape(dep, offset.x, offset.y);
      if(isInside(dep)){
         // Draw a single state
         fill(255, 255, 255, 0.8*255);
         shape(dep, offset.x, offset.y);
         
         //println(dep.getName());
         currentDept = dep.getName();
    }
    
  }
}

//Detectar si el mouse está en dicho departamento
boolean isInside(PShape sh) {
  
    return PGS_ShapePredicates.containsPoint(sh, new PVector(mouseX - offset.x, mouseY - offset.y));
}
