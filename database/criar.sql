CREATE TABLE Restaurant (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    restaurantName VARCHAR,
    adress VARCHAR,
    category VARCHAR CHECK (category IN ('italian', 'japanese', 'portuguese', 'fast food', 'european', 'mexican'))
);

CREATE TABLE Dish (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dishName VARCHAR NOT NULL,
    price INTEGER NOT NULL,
    category VARCHAR
);

CREATE TABLE Menu (
    restaurantId INTEGER REFERENCES Restaurant (id),
    dishId INTEGER REFERENCES Dish (id),
    CONSTRAINT MENU_ID PRIMARY KEY (restaurantId, dishId)
);

CREATE TABLE User (
    username VARCHAR PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    adress VARCHAR,
    phone VARCHAR UNIQUE
);


CREATE TABLE Owner (
    username VARCHAR REFERENCES User(username),
    CONSTRAINT Owner_ID PRIMARY KEY(username)
);

CREATE TABLE RestaurantOwner (
    username VARCHAR REFERENCES Owner(username),
    restaurantId INTEGER REFERENCES Restaurant(id),
    CONSTRAINT Restaurant_Owner_ID PRIMARY KEY (username, restaurantId)
);

CREATE TABLE Ord (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR REFERENCES User,
    restaurantId INTEGER REFERENCES Restaurant,
    state TEXT NOT NULL CHECK (state IN ('received', 'preparing', 'ready', 'delivered'))
);

CREATE TABLE OrderDish (
    orderId INTEGER REFERENCES Ord,
    dishId INTEGER REFERENCES Dish,
    CONSTRAINT Order_Dish_ID PRIMARY KEY (orderId, dishId)
);

CREATE TABLE Review (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    restaurantId INTEGER REFERENCES Restaurant (id),
    username VARCHAR REFERENCES User (username),
    rating REAL NOT NULL, 
    comment VARCHAR
);

CREATE TABLE FavoriteDish (
    dishId INTEGER REFERENCES Dish (id),
    userId VARCHAR REFERENCES User (username),
    CONSTRAINT FavoriteDish_ID PRIMARY KEY(dishId, userId)
);

CREATE TABLE FavoriteRestaurant (
    restaurantId INTEGER REFERENCES Restaurant (id),
    userId VARCHAR REFERENCES User (username),
    CONSTRAINT FavoriteRestaurant_ID PRIMARY KEY(restaurantId, userId)
);


---------------------------------------------------------------------------------------


PRAGMA foreign_keys = ON;

--Restaurant
INSERT INTO Restaurant VALUES (NULL, "Il Pizzaiolo Clérigos", "Rua de Candido dos Reis", "italian");
INSERT INTO Restaurant VALUES (NULL, "Tokkotai", "Rua do Comércio do Porto", "japanese");
INSERT INTO Restaurant VALUES (NULL, "McDonalds", "Estrada da Circunvalação", "fast food");

--Dish
INSERT INTO Dish VALUES (NULL, "Tiramisu", 5, "Sobremesa");
INSERT INTO Dish VALUES (NULL, "Calzone Napolitana", 9, "Pizza");
INSERT INTO Dish VALUES (NULL, "Lasagna", 10, "Principal");
INSERT INTO Dish VALUES (NULL, "Camarão Tigre Asiático", 23, "Entradas");
INSERT INTO Dish VALUES (NULL, "Salmão (6 peças)", 11, "Sashimi Tradicional");
INSERT INTO Dish VALUES (NULL, "Água", 2, "Bebida");
INSERT INTO Dish VALUES (NULL, "BigMac", 5, "Hamburguer");
INSERT INTO Dish VALUES (NULL, "McFlurry KitKat", 2, "Sobremesa");
INSERT INTO Dish VALUES (NULL, "Coca-Cola", 2, "Bebida");

--Menu
INSERT INTO Menu VALUES (1, 1);
INSERT INTO Menu VALUES (1, 2);
INSERT INTO Menu VALUES (1, 3);
INSERT INTO Menu VALUES (2, 4);
INSERT INTO Menu VALUES (2, 5);
INSERT INTO Menu VALUES (2, 6);
INSERT INTO Menu VALUES (3, 7);
INSERT INTO Menu VALUES (3, 8);
INSERT INTO Menu VALUES (3, 9);

--User
INSERT INTO User VALUES ("maria20", "maria", "maria20@gmail.com", "123456", "Rua das Flores", "962156489");
INSERT INTO User VALUES ("ricardo32", "ricardo", "ricardo32@gmail.com", "6543210", "Rua Dr. António José Almeida", "956320145");
INSERT INTO User VALUES ("miguel_012", "miguel", "miguel012@gmail.com", "5864102", "Rua Nova do Crasto", "93201523");
INSERT INTO User VALUES ("joana26", "joana", "joana26@gmail.com", "hfg41", "Rua Santa Luzia", "96254123");
INSERT INTO User VALUES ("1mafalda3", "mafalda", "mafalda13@gmail.com", "mfhg4", "Avenida 5 de Outubro", "91520236");


--Owner
INSERT INTO Owner VALUES ("ricardo32");
INSERT INTO Owner VALUES ("joana26");

--RestaurantOwner
INSERT INTO RestaurantOwner VALUES ("ricardo32", 1);
INSERT INTO RestaurantOwner VALUES ("ricardo32", 2);
INSERT INTO RestaurantOwner VALUES ("joana26", 3);

--Order
INSERT INTO Ord VALUES (NULL, "maria20", 2, "preparing");
INSERT INTO Ord VALUES (NULL, "miguel_012", 1, "received");
INSERT INTO Ord VALUES (NULL, "1mafalda3", 3,"ready");

--Order_Dish
INSERT INTO OrderDish VALUES (1, 4);
INSERT INTO OrderDish VALUES (1, 5);
INSERT INTO OrderDish VALUES (2, 3);
INSERT INTO OrderDish VALUES (3, 7);

--Review
INSERT INTO Review VALUES (NULL, 3, "1mafalda3", 7, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
INSERT INTO Review VALUES (NULL, 1, "miguel_012", 8, "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");
INSERT INTO Review VALUES (NULL, 2, "maria20", 9, "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.");


--Favorite_Dish
INSERT INTO FavoriteDish VALUES (1, "ricardo32");
INSERT INTO FavoriteDish VALUES (3, "joana26");
INSERT INTO FavoriteDish VALUES (7, "1mafalda3");

--Favorite_Restaurant
INSERT INTO FavoriteRestaurant VALUES (1, "miguel_012");
INSERT INTO FavoriteRestaurant VALUES (2, "maria20");
INSERT INTO FavoriteRestaurant VALUES (3, "joana26");