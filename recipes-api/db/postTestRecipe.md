{
	"name": "butteredBagel", 
		"ingredients": [
			"1 bagel", 
			"butter"
		],
	"instructions": [
		"cut the bagel", 
		"spread butter on bagel"
	]
}


http POST :3000/recipes recipe:='{"name": "butteredBagel8", "ingredients": ["1 bagel", "butter"],"instructions": ["cut the bagel", "spread butter on bagel"]}'

//blank ingredients for testing.
http POST :3000/recipes recipe:='{"name": "butteredBagel6", "ingredients": [],"instructions": ["cut the bagel", "spread butter on bagel"]}'

//put request
http PUT :3000/recipes recipe:='{"name": "butteredBagel8", "ingredients": ["20 bagels", "butter"],"instructions": ["cut the bagel in half", "spread butter on bagel"]}'

//put request when recipe doesn't exit
http PUT :3000/recipes recipe:='{"name": "butteredBagel100", "ingredients": ["2 bagels", "butter"],"instructions": ["cut the bagel in half", "spread butter on bagel"]}'
