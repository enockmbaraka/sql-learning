# Project Description

**Wilde's Scandinavian Display Association (WSDA)**

Wilde's Scandinavian Display Association (WSDA) is an online music retail company that sells digital music to customers worldwide. To support its operations, the company maintains a relational database named **WSDA_Music**, which stores and manages information about customers, employees, artists, albums, tracks, playlists, invoices, and sales transactions.

The WSDA Music Relational Database serves as the central repository for the company's data, enabling efficient management of its music catalog, customer purchases, sales performance, employee records, and business operations. The database also supports reporting, analysis, and data-driven decision-making.

The database contains the following major categories of information:

   - **Music Catalog**: Details of artists, albums, tracks, playlists, and music genres.

   - **Customer Information**: Customer names, contact details, and account records.

   - **Employee Records**: Employee information, including job roles and organizational details.

   - **Sales and Transactions**: Purchase records, invoices, payment transactions, and revenue generated from music sales

**Table Relationships**

Artists create albums; albums contain tracks; tracks belong to genres and media types; employees have reporting relationships; employees serve as support representatives for customers; customers generate invoices; invoices consist of invoice lines; tracks are associated with invoice lines; playlists include tracks; and tracks can be part of multiple playlists.

The tables are connected as follows: artists have albums; albums have tracks with genres and media types; employees have supervisors; employees also support customers; customers have invoices; invoices have invoice lines with tracks; and playlists have playlist tracks with tracks. These relationships allow for efficient organization and retrieval of data across the database tables.


### Tasks

#### Task 1 : Concise Track Pricing Report

WSDA management team wants to generate a straightforward report showcasing their track offerings, along with pricing details to enhance their database management processes.

Task:

Generate a report listing track names alongside their unit prices.

Result:

A list containing two columns: Track Name and Price.

• Track Name field contains a list of track names

• The Price field contains the UnitPrice of each track

• It must only include the first 20 tracks, sorted by track name

• State the purpose of the query

#### Task 2: Analyzing Customer Support Interactions
At WSDA, understanding customer support dynamics is crucial for enhancing customer satisfaction and service efficiency. The management is interested in analyzing the interactions between customers and their support representatives.

Task:

Write a SQL query to generate a report that lists each customer along with their assigned support representative.
Result:

A list containing the first and last names of both customers and their assigned support representatives.

• Customer FirstName field contains the first names of customers

• Customer LastName field contains the last names of customers

• Employee FirstName field contains the first names of support representatives

• Employee LastName field contains the last names of support representatives

• Order the results by the support representative's last name, followed by the customer's last name.


#### Task 3: Customer Postal Code Transformation at WSDA
WSDA is updating their customer database for a marketing campaign, aiming to standardize the postal codes for all US-based customers to ensure successful delivery. Your job is to create a report that adjusts the postal codes to a uniform format.
Task:

Write a SQL query that selects the customer's full name and transforms their postal code into a standardized five-digit format.

Result:

A list containing two columns: CustomerFullName and StandardizedPostalCode.

• CustomerFullName field concatenates the customer's first and last name

• The StandardizedPostalCode field contains the postal code adjusted to a five-digit format

• Results should only include customers from the United States

• State the purpose of the query

• Order the results by the CustomerFullName field


#### Task 4: What is the average invoice total by city?

#### Task 5: What are the average invoice totals by city for only the cities that start with L?

#### Task 6: Find all average totals that are greater than $5.

#### Task 7: What are the average invoice totals greater than $5 for cities starting with B?

#### Task 8: What are the average invoice totals by billing country and city?

#### Task 9: Calculate Customer Average Spend per City at WSDA

#### Task 10: WSDA is eager to optimize their marketing strategies by identifying cities with the highest customer spending. This analysis will help allocate their marketing budget more efficiently by targeting cities with the greatest sales potential.

Task:

Create a SQL report that calculates the average spending amount of customers in each city.

Result:

Your report should include a list containing two columns: City and AverageSpending by customers in those cities.

• City field contains the names of cities

• AverageSpending field contains average amount spent by customers

• State the purpose of the query

• The list should be in ascending order by city name

#### Task 11: How is each city performing against global average sales?

-global average sales amount

-average sales per city

#### Task 12: What are the invoices that are less than global average?

#### Task 13: How is each city performing against the global average sales?

#### Task 14: Get all invoices that occurred after this particular date.

- WSDA Management Team is interested in three particular invoices, select these individual invoices;

#### Task 15: Which tracks are not selling?

#### Task 16: Uncovering Unpopular Tracks at WSDA
WSDA is looking to optimize their inventory and marketing strategy by focusing on tracks that haven't been selling well. Your mission involves diving into the database to identify these tracks, offering insights that could guide decisions on promotions or discontinuations.

Task

Write a SQL query that identifies tracks that have never been sold. Your query should return a list of these tracks, along with their composers and the genre.

Result

Your report should include a list that includes the Track ID, Track Name, Composer, and Genre for each track that has never been sold.

•	Track ID field shows a unique number for each track

•	Track Name field lists the titles of songs or pieces of music

•	Composer field mentions who created the music

•	Genre field indicates the style or category of the music, like rock or classical

•	The results should be ordered by Track Name in ascending order.
