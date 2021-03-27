# Rocket-Elevator-Foundation
Week 9 of Odyssey - Consolidation of Achievements

__________________________________________________

LINK TO WEBSITE; https://www.rocketelevators-em.tk/

LINK TO REST API REPOSITORY; https://github.com/emtl688/Rocket_Elevators_RESTAPI2.0.git 

To Login as an Employee;

use one of the following emails

nicolas.genest@codeboxx.biz |
nadya.fortier@codeboxx.biz |
martin.chantal@codeboxx.biz |
mathieu.houde@codeboxx.biz |
david.boutin@codeboxx.biz |
mathieu.lortie@codeboxx.biz |
thomas.carrier@codeboxx.biz |

with the password being :   codeboxx1

__________________________________________________


[INTERVENTION FORM]

once logged in as an employee, you will be able to access the INTERVENTIONS tab from the nav bar;

![image](https://user-images.githubusercontent.com/74794151/112703728-57789880-8e6e-11eb-911b-dbe2e6672e17.png)


Once the form has been filled out and submitted, it will add a new intervention to the Interventions table in the MySQL database;
By default, start and end dates are null and the status is "Pending"


![image](https://user-images.githubusercontent.com/74794151/112703931-18971280-8e6f-11eb-862d-6a8f77396fb4.png)



__________________________________________________


[ZENDESK]

Once an Intervention has been submitted, Zendesk automatically sends an email and creates a ticket in the zendesk portal with all the entered information;



Email:

![image](https://user-images.githubusercontent.com/74794151/112703965-42e8d000-8e6f-11eb-91cd-61405160d616.png)



Ticket:

![image](https://user-images.githubusercontent.com/74794151/112703975-4e3bfb80-8e6f-11eb-995a-4b4bfc1d5631.png)


____________________________________________________


[REST API]

The REST API needs to be modified and enhanced to offer data through new interaction points:
GET: Returns all fields of all intervention Request records that do not have a start date and are in "Pending" status.
PUT: Change the status of the intervention request to "InProgress" and add a start date and time (Timestamp).
PUT: Change the status of the request for action to "Completed" and add an end date and time (Timestamp).

Link to my postman collection for this week's required enpoints;

https://www.getpostman.com/collections/9cc61d3e320bbb75cd89

--IMPORTANT--

For the PUT requests allowing us to change the statuses and add start/end dates. Simple replace the {id} placeholder with the Id of the intervention you wish to edit.



