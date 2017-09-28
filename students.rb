students = []
eye_colors = []
ages = []
drivers = []
green_eyed_girls = []
sophomores = []


File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
end 

# print students, "\n"
# print eye_colors, "\n"
# print ages, "\n"

#0	Students w/ brown eyes
def brown_eyes(eye_colors)
	brown = 0
	eye_colors.each do |eye_color|
		if eye_color == "Brown"
			brown += 1		
		end
	end
	return brown	
end

puts brown_eyes(eye_colors), "\n"


#1	List of students old enough to drive
def students_who_can_drive(ages, students, drivers)
	ages.each_with_index do |age, i|
		if age >= 16
			student_name = students[i]
			drivers.push(student_name)
		end
	end
	return drivers
end

puts students_who_can_drive(ages, students, drivers), "\n" 


#2	List of green eyed girls
def all_green_eyed_girls(eye_colors, green_eyed_girls, students)
	eye_colors.each_with_index do |eye, i|
		if eye == "Green" && i % 2 == 0
			girls_name = students[i]
			green_eyed_girls.push(girls_name)	
		end
	end
	return green_eyed_girls
end

puts all_green_eyed_girls(eye_colors, green_eyed_girls, students), "\n"

#3	List of sophomores
def most_vowles(students, ages, sophomores)
	ages.each_with_index do |age, i|
		if age == 15
			sophomores_name = students[i]
			sophomores.push(sophomores_name)
		end
	end

	num_of_vowels = []

	sophomores.each do |st_name|
		vowels_in_name = 0
		st_name.chars.each do |vowel|
			if vowel.downcase == "a" || vowel.downcase == "e" || vowel.downcase == "i" || vowel.downcase == "o" || vowel.downcase == "u"
				vowels_in_name += 1
			end		
		end
		num_of_vowels.push(vowels_in_name)
	end

	maximum = 0
	with_most_vowels = ""

	num_of_vowels.each_with_index do |number, i|
		if number > maximum
			maximum = number
		end
		
		if number == maximum
			with_most_vowels = sophomores[i]
		end
	end
	return with_most_vowels
end

puts most_vowles(students, ages, sophomores), "has the most vowels in their name", "\n"

#average age for green eyed students
def green_eye_ages(ages, eye_colors)
	with_green_eyes = 0
	st_age = 0
	eye_colors.each_with_index do |eye, i|
		if eye == 'Green'
			with_green_eyes += 1
			st_age += ages[i]
		end
	end
	average_green_age = st_age / with_green_eyes
	return average_green_age
end

puts green_eye_ages(ages, eye_colors), "is the average age for the green eyed students", "\n"