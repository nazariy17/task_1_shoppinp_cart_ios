# task_1_shoppinp_cart_ios

***** Briefing / Task *****
1. Complete the task using the Swift language.
2. 3rd party frameworks are not allowed.
3. Unit tests are a good plus.

- Write a mobile application and associated unit tests that can price a basket of goods in a number of different currencies
- The goods that can be purchased, which are all priced in US$, are:
  • Peas: $ 0,95 per bag
  • Eggs: $ 2,10 per dozen
  • Milk: $ 1,30 per bottle
  • Beans: $ 0,73 per can
- The program shall allow the user to add or remove items in a basket. The user can click on a checkout button, which will then display the total price for the basket with the option to display the amount in different currencies. For example, if the basket contained milk and the currency selected was EUR with an exchange rate of 1.1, the total would be 1.43 EUR.
- No UI design constraints are enforced so feel free to design the UI in the way you see as most appropriate for the solution.
- The list of currencies shall be consumed from http://jsonrates.com/. To convert to other currencies, you will need to create an account. This will then issue you with an API-Key that permits reading from the various public APIs listed on their site. The exchange rates may change at any time.





***** Description *****
The app is based on Viper Arquitecture. Not an original version of VIPER (I think the original one can cause more harm than good) but still, Interactor and Presnter are there and we still have SOLID approach.
Besides VIPER, app count on delegates and singleton (loading screen) pattern as well.
The data is saved via Models Classes and has a limited life cycle (only persist while app is running).
App counts heavely on delegates in order to propagate the data and update view.
An alternative could be a usage of Core Data or REALM with Notification. I would prefer this REALM & NotificationCenter approach.
For Internet connection app counts on URLSession (check networkAPI.swift)

Usually I develop apps using 3pass approach.
1º - layout, animations and functionalities (nothing related to the network call)
2º - app logic - network call - data saving - calcs, etc
3º - polish the app. Real life testing (besides the Unit test)

No 3rd Library or Framework were used.
Popup is build with native iOS Interface Builder and classes.




***** UI *****
I decided to build simple UI based on UI Collections and Table View with Popups.
The approach is to use visual recogniton capabilities of human eyes, so we need to use icons and images whenever it applies.
Some animation were used to create "fluid" effect and to enrich the user experience. Attention to the details is very important!




***** Known issue *****
- App won't save the data in correct persistence way (using Realm or CD) - for this task I will use NSUserDefaults because of complexity and deadline. In normal comercial project I would go with REALM
- The images of products are saved as an image asset, so in order to add more products besides we need to add it to the plist we need to add the image. This can be easily changed to cloud images.
- I don't use any product ID since they make no sense with this task.




***** Credits *****
close_icon - Dave Gandy
