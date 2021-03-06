# flutter_assignment




## Aim

Build a simple 2 page flutter application for displaying store listing. The application should have
two screens. On the home screen, there should be a button which on clicks

    1. Loads the data (json containing listing of 1000 product images) from assets/ into memory
    and then stores it into a local app database (any of the following databases: sqlflite,
    objectbox, hive). The json itself is generated using a generator script (could be in any
    language). The important data fields to be kept in json are: productName, productUrl,
    productRating, productDescription.

        a. ProductName: Generate in alphabetical order. Eg: Product A, Product B,...
        Product Z, Product AA… & so on

        b. productUrl: The list of URLs doesn’t need to be ecommerce product. It could be
        taken from existing sources as well. This could be a good example to take urls
        from: https://www.kaggle.com/google/google-landmarks-dataset?select=train.csv

        c. productRating: Random between 0-5

        d. productDescription: Lorem ipsum or any fake description would be fine.

    2. Navigates the user to the second screen.
    In the second screen, we load the data from the selected database into memory and display the
    list of the products, taking the page performance into consideration.
       - Display all attributes of the product in a neat looking UI cards and a scrollable list.
       - While the images are being loaded, the screen shouldn’t glitch and hold the same size.
       - While the images are being loaded, show a loader.gif loaded from assets/
       - Cache the images so that pressing the back button and coming back to the same screen
       doesn’t put the network call again.

  

## Run Locally


Clone the project

```bash
  git clone https://github.com/lazy-geek/Momento
```

Go to the project directory

```bash
  cd Momento
```

Install dependencies

```bash
  flutter pub get
```

```bash
  flutter run
```

## ScreenShots

<div>
<img src="github-assets\1.png" alt="Home Page" width="200"/>
<img src="github-assets\2.png" alt="Products Page" width="200"/>
<div>

## Video Demo

[youtube](https://youtu.be/RY82ekM6T6o)

## Download App
[Download](https://drive.google.com/file/d/1REgHqMkKNe955BRW_idTD4A653JwZ6lR/view?usp=sharing)
