# RedfinTechnical.rb
Coding challenge for Redfin

### **Data**
The San Francisco government’s website has a public data source of food trucks (https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b). The data can be accessed in a number of forms, including JSON, CSV, and XML. How you access the data is up to you, but you can find some useful information about making an API request to this data source here (https://dev.socrata.com/foundry/data.sfgov.org/bbb8-hzi6). 
### **The Problem**
Write a command line program that prints out a list of food trucks that are open at the current date, when the program is being run. So if I run the program at noon on a Friday, I should see a list of all the food trucks that are open then. 

Please display results in pages of 10 trucks. That is: if there are more than 10 food trucks open, the program should display the first 10, then wait for input from the user before displaying the next 10 (or fewer if there are fewer than 10 remaining), and so on until there are no more food trucks to display. Display the name and address of the trucks and sort the output alphabetically by name. 


## **To Proceed**  
If Ruby is not already installed on your computer, please download it (https://www.ruby-lang.org/en/downloads/).
Alternatively you can use (https://rvm.io/) to download RVM - Ruby Version Manager for MacOS, or (https://rubyinstaller.org/) to use RubyInstaller on a Windows machine.  

1. Clone the file and cd into it. 
2. Install the following gems: httparty, terminal-table. 
    You can find more information on these gems: [httparty](https://rubygems.org/gems/httparty/versions/0.17.0),[terminal-table[(https://github.com/tj/terminal-table)
    
3. Run the program from the terminal using 
  `ruby redfintc.rb`
  ## **Example**
  ```
  Redfin 🦖ruby redfintc.rb
+------------------------+-----------------+
|               Food trucks                |
+------------------------+-----------------+
| Name                   | Location        |
+------------------------+-----------------+
| Bay Area Dots, LLC     | 900 BEACH ST    |
| Bay Area Dots, LLC     | 567 BAY ST      |
| El Tonayense #60       | 2355 FOLSOM ST  |
| Expresso Subito, LLC.  | 85 02ND ST      |
| Golden Gate Halal Food | 979 MARKET ST   |
| Got Snacks             | 1020 03RD ST    |
| Halal Cart, LLC        | 901 MARKET ST   |
| Halal Cart, LLC        | 455 MARKET ST   |
| Julie's Hot Dogs       | 2386 MISSION ST |
| Junior Barbecue Burger | 2045 EVANS AVE  |
+------------------------+-----------------+
Would you like to see the full list? (Y or N): 
n
Thank you. Exiting.
 ``` 
## **What would I do differently if I were asked to build this as a full-scale web application:**
  At a high-level I could re-build this using Ruby/Rails (or other software to create MVC), and create a webpage for the user to interact with. This would allow me to separate the front-end/back-end, increase security, and give the user more choices and information. In a larger application I could utilize a token and secure it in a file that is hidden from github keeping the information secure. It would be possible to update the DOM without having to reload the whole page. User information could be checked as they enter it and if they enter incorrect information, the program could give a more specific error message. I would be able to give users more control over what information they want like neighborhoods or foods offered, by utilizing variables into the get request sent to the api. Testing would also be more comprehensive.
