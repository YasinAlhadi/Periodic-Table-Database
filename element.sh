#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# Check if argument is not empty
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

# If argument is number
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT=$($PSQL "SELECT  atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$1'")
else
  # If argument is string
  ELEMENT=$($PSQL "SELECT  atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1'")
fi

# If element is not in the database
if [[ -z $ELEMENT ]]
then
  echo I could not find that element in the database.
  exit
fi

# print element info
echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
do
  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
done
