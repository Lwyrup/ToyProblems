function anagramChecker(array){
	var formated = []
	var sorted = []
	for(var i = 0; i < array.length; i++){
		formated.push(array[i].replace(/ /g, "").toLowerCase())
		sorted.push(formated[i].split("").sort());
	}
return console.log( "Is [" + array + "] anagram: " + (sorted[0].join("") === sorted[1].join("")));
}

//CODE EXECUTION BEGINS HERE
var tests =[["wisdom", "mid sow"],
["Seth Rogan", "Gathers No"],
["Reddit", "Eat Dirt"],
["Schoolmaster", "The classroom"],
["Astronomers", "Moon starer"],
["Vacation Times", "I'm Not as Active"],
["Clint Eastwood", "Old West Action"]]

for(var i = 0; i < tests.length; i++){
	anagramChecker(tests[i])
}







