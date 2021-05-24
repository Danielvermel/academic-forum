
# Table of Content
- [Description](#description)
- [Setup](#setup)
- [Database Design](#database-design)
- [Project Preview](#project-preview)

## Description

This is a small prototype project for a website where academics can discuss books and articles. This project uses the following technologies:
- Postgres as a database;
- Sails.js as a web server;
- Sails' Parasails, which is a wrapper over Vue, for frontend code;
- Less and Bootstrap for styling;


<a id="setup"></a>
## Setup
1. Download [Node.js](https://nodejs.org/en/download/);
2. Install Sails.js by running in your terminal `npm install sails -g` ;
3. Download the project by using `git clone git@github.com:Danielvermel/academic-forum.git` in your terminal;
4. Download [PostgreSQL](https://www.postgresql.org/download/);
5. Go to your ([pgadmin](https://www.pgadmin.org/download/) or [psql](https://www.postgresqltutorial.com/connect-to-postgresql-database/#:~:text=psql%20%E2%80%93%20a%20terminal%2Dbased%20front,end%20to%20PostgreSQL%20database%20server.));
6. Run this script [db_script.sql](https://github.com/Danielvermel/academic-forum/blob/master/database_script.sql) to create and populate the database;
7. Make sure to go [datastores.js](https://github.com/Danielvermel/academic-forum/blob/master/config/datastores.js) and configure the proper connection to your database `postgresql://user:password@host:port/database` ;
8. In your terminal run `npm i` to install all dependencies;
9. And finally run `sails lift`;

<a id="database-design"></a>
## Database Design

<p align="center">
  <img src="https://user-images.githubusercontent.com/32749108/119404954-72ce1b80-bcd8-11eb-8de2-d75d2a7660a0.jpg" height="75%" width="75%" />
</p>

<a id="project-preview"></a>
##  Project Preview


### Books List (Home Page) 
![bookList](https://user-images.githubusercontent.com/32749108/119316162-8775c980-bc6e-11eb-9582-b6d331cab52e.jpg)

### Book View (Page)
![bookView](https://user-images.githubusercontent.com/32749108/119315934-441b5b00-bc6e-11eb-9418-011a9f4c1e61.jpg)

### Articles List (Page) 
![articleList](https://user-images.githubusercontent.com/32749108/119315982-52697700-bc6e-11eb-846e-a42b170e101e.jpg)

### Article View (Page)
![articleView](https://user-images.githubusercontent.com/32749108/119316055-67460a80-bc6e-11eb-9b43-1875848de2ed.jpg)
