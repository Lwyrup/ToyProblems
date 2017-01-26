function anagramChecker(array){
	var formated = []
	var sorted = []
	for(var i = 0; i < array.length; i++){
		formated.push(array[i].replace(/ /g, "").toLowerCase())
		sorted.push(formated[i].split("").sort());
	}
return console.log( "Is [" + array + "] anagram: " + (sorted[0].join("") === sorted[1].join("")));
}

anagramChecker(["Clint Eastwood", "Old West Action"]);