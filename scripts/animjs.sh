#!/usr/bin/env bash

mkdir $1 &&
cd $1 &&
touch index.html style.css script.js &&
echo "<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title> Learn Javascript </title>
</head>

    <body>

    </body>

<script src="script.js"> </script>
</html>
 " > index.html &&
echo "Initialize Git repo" &&
git init &&
git add . &&
git commit -m "Initial commit" &&
vim .


