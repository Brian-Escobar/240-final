
//Author Information:
//Author: Luis Alvarado
//Email: luisalvarado@csu.fullerton.edu
//Section: CPSC 240-07
//Program Information:
//Program Name: Final
//==============================================================================
#include <iomanip>
#include <iostream>

extern "C" double electric();

int main() {
  double electric_ = 0.0;

  printf("Welcome to the Electric Power Program by Luis Alvarado. \n");

  electric_ = electric();

  printf("The caller recieved this number %.4lf and will keep it. \n", electric_);

  printf("A zero will be sent to the OS as a signal of success.");

  return 0;

}
