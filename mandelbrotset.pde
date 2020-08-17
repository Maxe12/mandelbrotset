size(600, 600);
noLoop();
background(255);
loadPixels();
int maxIterations = 80;
for (int row = 0; row < height; row++) {
   for (int col = 0; col < width; col++) {
      double c_re = (col - width/2.0) * 4.0/width;
      double c_im = (row - height/2.0) * 4.0/width;
      double x = 0, y = 0;
      int iterations = 0;
      while (x*x+y*y <= 4 && iterations < maxIterations) {
          double x_new = x*x - y*y + c_re;
          double y_new = 2*x*y + c_im;
          x = x_new;
          y = y_new;
          iterations++;
      }
      if (iterations < maxIterations) {
        float cl = map(iterations, 0, maxIterations, 0, 255);
        pixels[col + row * width] = color(cl);
      }
      else pixels[col + row * width] = color(0);
   }
}
updatePixels();
