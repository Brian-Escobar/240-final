
//Author Information:
//Author: Brian Escobar
//Email: brianescobar523@csu.fullerton.edu
//Section: CPSC 240-09
//Program Information:
//Program Name: Final
//==============================================================================
#include <iomanip>
#include <iostream>

extern "C" double electric();

int main() {
  double electric_ = 0.0;

  printf("Welcome to the Electric Power Program by Brian Escobar. \n");

  electric_ = electric();

  printf("The caller recieved this number %.4lf and will keep it. \n", electric_);

  printf("A zero will be sent to the OS as a signal of success.");

  return 0;

}
