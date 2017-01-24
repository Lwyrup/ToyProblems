function vowelEater(string){
	string = string.replace(/a/g, "").replace(/e/g, "").replace(/i/g, "").replace(/o/g, "").replace(/u/g, "").replace(/ /g, "")
	return string;
}

console.log(vowelEater("Hello"))