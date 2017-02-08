#  	n-	f-	w-	e-	g-

# n-	1	1	1	1	1

# f-	1	.5	.5	1	2

# w-

# e-

# g-

types = ["normal","fire","water","electric","grass","ice","fighting","poison","ground","flying","psychic",
		 "bug","rock","ghost","dragon","dark","steel","fairy"]

dmg_chart = { 

	"normal"=>{"normal"=>1},

	"fire"=>{
		"normal"=>1 , "fire"=>0.5, "water"=>0.5, "electric"=>1 , "grass"=>2 , "ice"=>2 , "fighting"=>1 , "poison"=>1 ,
		"ground"=>1 , "flying"=>1 , "psychic"=>1 , "bug"=>2 , "rock"=>0.5, "ghost"=>1 
		},

	"water"=>{
		"normal"=>1 , "fire"=>2 , "water"=>0.5, "electric"=>1 , "grass"=>0.5, "ice"=>1, "fighting"=>1 , "poison"=>1 ,
		"ground"=>2 , "flying"=>1 , "psychic"=>1 , "bug"=>1 , "rock"=>2 , "ghost"=>1 
		},

	"electric"=>{
		"normal"=>1 , "fire"=>1 , "water"=>2 , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"grass"=>{
		"normal"=>1 , "fire"=>0.5, "water"=>2 , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"ice"=>{
		"normal"=>1 , "fire"=>0.5, "water"=>0.5 , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"fighting"=>{
		"normal"=>2 , "fire"=>1 , "water"=>1 , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"poison"=>{
		"normal"=>1 , "fire"=>1 , "water"=>1 , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
	}	

	"ground"=>{
		"normal"=>1 , "fire"=>2 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"flying"=>{
		"normal"=>1 , "fire"=>1 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"psychic"=>{
		"normal"=>1 , "fire"=>1 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
	}

	"bug"=>{
		"normal"=>1 , "fire"=>0 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"rock"=>{
		"normal"=>1 , "fire"=>2 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
		},

	"ghost"=>{
		"normal"=>0 , "fire"=>1 , "water"=> , "electric"=> , "grass"=> , "ice"=> , "fighting"=> , "poison"=> ,
		"ground"=> , "flying"=> , "psychic"=> , "bug"=> , "rock"=> , "ghost"=> 
	}

}
# first is attk second is defence
puts dmg_chart["fire"]["normal"]