function vowelEater(string){
	var nstring = string.replace(/a/g, "").replace(/e/g, "").replace(/i/g, "").replace(/o/g, "").replace(/u/g, "").replace(/ /g, "")
	return string + " => *nom* *nom* => " + nstring ;
}

console.log(vowelEater("I enjoy a good use of the vowels."))