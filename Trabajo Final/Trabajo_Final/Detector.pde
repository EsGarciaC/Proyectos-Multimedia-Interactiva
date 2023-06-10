color[] colores = {};


void DesabilitarTodosLosEstilos(PShape pais){
  
  for(int i = 0; i < pais.getChildCount();i++){
    
    pais.getChild(i).disableStyle();
    pais.getChild(i).scale(1.5);
    colores = append(colores, color(random(255),random(255),random(255)));
  }

}
PShape dep;
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
         
         println(dep.getName());
    }
    
  }
}


boolean isInside(PShape sh) {
  
    return PGS_ShapePredicates.containsPoint(sh, new PVector(mouseX - offset.x, mouseY - offset.y));
}
