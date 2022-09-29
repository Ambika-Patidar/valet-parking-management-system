**Design and implement a valet parking management system.**



**Functional requirement of the system:-**

The parking garage has three types of parking spots for three kinds of vehicle sizes. Vehicle size: small, medium, and large.
A small vehicle can park in a small, medium, and large spot.
A medium vehicle can park in a medium and large spot.
A large vehicle can only park in a large spot.
Numbers of each type of parking spot are fixed and should be provided by the Valet parking manager when s/he installs the system for the very first time.



Valet parking system provides below two methods for the valet:-

admitTheCar (String licensePlatNumber, string carsize) {

// this method checks if there is space available to park the car inside 

// this method returns success if there is a parking spot available for given // carsize.

// This method also assign the car to that the specific parking spot 

// This method returns failure if there is no parking spot available to park the car.

}


ExitTheCar(String licensePlatNumber){

//return the success if the car is parked inside the car and free up space.

// return the failure if the car is not parked inside the garage

}



**Expectation:-**

1. Design a class and expose methods to "admit" and "exit" the car.

2. Variable, method, and class name should be meaningful.

3. Code should be time and space-optimized.

4. There should not be duplicate code. If you have to write the same code multiple times, then think about putting that into the shared method.

5. Read the example carefully and handle it in the code.





**Example : **

Suppose there are 1 small, 1 medium, 1 large type of spot in the garage. Let's name the space as 1S(small), 1M, 1L

1. Small car "A" comes in :
  `admitTheCar` will return success. 
  Car A is parked into 1S

2. Small car "B" comes in :
  `admitTheCar` will return success. 
  Car B is parked into 1M

3. Small car "C" comes in : 
  `admitTheCar` will return success. 
  Car C is parked into 1L

4. Small car "A" leaves 
  ExitTheCar() will return success 
  1S is now available

5. Large car "D" comes in 
  `admitTheCar` will return success. 
  1M and 1D is occupied by small car but 1S is free 
  So the system has to manage to shuffle the car so that small car "C" goes into parking spot 1S 
  After shuffling parking spot "1L" is available for car `D`
