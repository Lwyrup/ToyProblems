function rollForInitative(string){
	var rollresult = [];
	var inputNums = string.split("d");
	var numOfDie = parseInt(inputNums[0]);
	var faceOfDie = parseInt(inputNums[1]);
	console.log("A " + faceOfDie + " sided die is rolled " + numOfDie + " times.")

	for(var i = 0; i < numOfDie; i++){
		rollresult.push(Math.ceil(Math.random()*faceOfDie));
	}
	return "The dice roll... " + rollresult + "\n";
}

console.log(rollForInitative("2d20"))
console.log(rollForInitative("10d6"))