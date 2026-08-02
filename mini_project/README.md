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
