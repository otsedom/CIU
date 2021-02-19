size(800,800);
background(0);
fill(255);
//Primera fila

for (int j=0;j<=600;j=j+200){
  for (int i=0;i<=600;i=i+200){
    rect(i,j,100,100);
    rect(i+100,j+100,100,100);
  }
}
