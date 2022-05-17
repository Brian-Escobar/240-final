
//Author Information:
//Author: Brian Escobar
//Email: brianescobar523@csu.fullerton.edu
//Section: CPSC 240-09
//Program Information:
//Program Name: Final
//==============================================================================
#include <iomanip>
#include <iostream>

extern "C" double resistance();

int main() {
  double resistance_ = 0.0;

  printf("Welcome to the Electric Resistance Program by Brian Escobar. \n");

  resistance_ = resistance();

  printf("The caller recieved this number %.4lf and will keep it. \n", resistance_);

  printf("A zero will be sent to the OS as a signal of success.");

  return 0;

}
