# sql-structure
Development of database structures addressing concepts and practices related to MySQL for the design and management of relational databases.

## Level 1 - Optical Store

The repository models the management of an optician. Here are the key points summarized:

| **Entities** | **Atributes**                                                                                                                 |
| -------------| ----------------------------------------------------------------------------------------------------------------------------- |
| Suppliers    | Name, address, phone, fax, TIN.                                                                                               |
| Glasses      | Brand, prescription, frame type, frame and lens color, price.                                                                 |
| Customers    | Name, address, phone, email, registration date. When registering a new customer, store who recommended them.                  |
| Sales        | Sales	Register the employee who made the sale and define a time period.                                                      |


### Optics Verification Queries:

1 - List the total purchases of a customer.
2 - List the different glasses sold by an employee during a year.
3 - List the different suppliers who have supplied glasses successfully sold for the optician.

    [!NOTE]
    To perform these verifications, you can find the query scripts in the directory level-1/1-optics/scripts. Refer to these scripts to verify that the design is correct.

## Level 1 - Pizzeria

This level focuses on designing a website for a pizzeria's orders. Highlights:
Entities	Highlighted Attributes
Customers	Name, address, postal code, phone.
Orders	Date/time, delivery type, quantity and types of products, total price.
Products	Pizzas, burgers, drinks.
Pizza Categories	Unique identifier and name.
Employees	Name, last name, TIN, phone, role (cook or delivery person).


| **Entities** | **Atributes**                                                                                                                 |
| -------------| ----------------------------------------------------------------------------------------------------------------------------- |
| Customers    | Name, address, postal code,, phone.                                                                                           |
| Orders       | Date/time, delivery type, quantity and types of products, total price.                                                                 |
| Customers    | Name, address, phone, email, registration date. When registering a new customer, store who recommended them.                  |
| Sales        | Sales	Register the employee who made the sale and define a time period.                                                      |

Pizzeria Verification Queries:

    List how many "Drinks" products have been sold in a specific location.
    List how many orders a specific employee has made.

    [!NOTE]
    To perform these verifications, you can find the query scripts in the directory level-1/2-pizzeria/scripts. Refer to these scripts to verify that the design is correct.

Level 2 - YouTube

This level represents a reduced version of YouTube with the following features:
Entities	Highlighted Attributes
Users	Email, password, username, date of birth, gender, country, postal code.
Videos	Title, description, size, video file name, duration, thumbnail, views, likes, dislikes.
Channels	Name, description, creation date.
Playlists	Name, creation date, status (public or private).
Level 3 - Spotify

This level represents the necessary database for Spotify with free and premium users:
Entities	Highlighted Attributes
Users	Email, password, username, date of birth, gender, country, postal code.
Premium Subscriptions	Start date, renewal date, payment method.
Credit Cards	Number, expiration month and year, security code.
Playlists	Title, number of songs, creation date, status (active or deleted).
Songs	Title, duration, plays.
Albums and Artists	Unique identifiers, names, images.
Follows and Favorites	Follows of artists, albums, and songs.
License

This project is licensed under the MIT License - see the LICENSE.md file for more details.
