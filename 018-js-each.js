// For each in array do this thing to it...
function each(array, thing){
	result = [];
	for (i = 0; i < array.length; i++){
		result.push(thing(array[i]));
	};
	return result;
};


function yell(it){
	return it.toUpperCase().concat("!");
};



var friends = ["Dan","Mindy","Devon","Alex"]

console.log( each(friends, yell) );
each(friends, console.log);