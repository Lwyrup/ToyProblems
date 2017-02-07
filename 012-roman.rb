require'pry'

#converstion table and count
values = [
m = 1000,
d = 500,
c = 100,
l = 50,	
x = 10,
v = 5,
i = 1]


origin = 364
input = origin

m_count = 0
d_count = 0
c_count = 0
l_count = 0
x_count = 0
v_count = 0
i_count = 0
numeral = ""
#loop like the change problem

while(input > 999) 
	input -= 1000
	m_count += 1
end

while(input > 499) 
	input -= 500
	d_count += 1
end

while(input > 99) 
	input -= 100
	c_count += 1
end

while(input > 49)
	input -= 50
	l_count += 1
end

while(input > 9)
	input -= 10
	x_count += 1
end

while(input > 4)
	input -= 5
	v_count += 1
end

while(input > 0)
	input -= 1
	i_count += 1
end

# values.each do |numer, i|
# 	puts numer
# end

#show result

numeral = ("m"*m_count + "d"*d_count + "c"*c_count + "l"*l_count + "x"*x_count + "v"*v_count + "i"*i_count).upcase
puts "#{origin} is #{numeral}"


