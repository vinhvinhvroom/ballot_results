require 'pry'
vote_results =
  {
    "Precinct 1" => {
      'Mary Sue' => 218,
      'Sally Jane' => 455,
      'Billy Joe' => 185
    },
    "Precinct 2" => {
      'Mary Sue' => 229,
      'Sally Jane' => 41,
      'Billy Joe' => 35
    },
    "Precinct 3" => {
      'Mary Sue' => 297,
      'Sally Jane' => 423,
      'Billy Joe' => 488
    },
    "Precinct 4" => {
    'Mary Sue' => 283,
    'Sally Jane' => 171,
    'Billy Joe' => 353
    }
  }

# 1) Generate the voting totals by Precinct and Candidate as shown in the directions.
puts "1)"
vote_results.each do |precinct, results|
  puts "*** In #{precinct}***"
  results.each do |candidate, votes|
    puts "-#{candidate} got #{votes} votes."
  end
  puts "\n"
end

# 2) How many people voted in each precinct? Create a new hash where the keys name the precinct and the values start at 0. Iterate over the provided `vote_results` to update the totals.
puts "2)"
vote_totals = {
  "Precinct 1" => 0,
  "Precinct 2" => 0,
  "Precinct 3" => 0,
  "Precinct 4" => 0
}

vote_results.each do |index, results|
  results.each do |candidate, votes|
    vote_totals[index]+= votes
  end
  puts "#{vote_totals.key(vote_totals[index])} had #{vote_totals[index]} votes."
end
puts "\n"
# 3) Which precinct had the highest voter turnout? Use the hash you created in Question 2 to return the answer.
highest_voter_turnout = vote_totals.values.max
highest_precinct = vote_totals.key(highest_voter_turnout)
puts "3) #{highest_precinct} had the highest voter turnout with #{highest_voter_turnout} votes."
puts "\n"
# 4) Output the total number of votes per candidate in the format seen above. Create a new hash where the keys name the candidate and the values start at 0. Iterate over the provided `vote_results` to update the totals.
puts "4)"
candidate_totals = {
  "Mary Sue" => 0,
  "Sally Jane" => 0,
  "Billy Joe" => 0
}

vote_results.each do |index, results|
  results.each do |candidate, votes|
     candidate_totals[candidate] += votes
  end
end

candidate_totals.each do |index, value|
  puts "#{index} had #{value} votes."
end
puts "\n"
# 5) Who was the winning candidate in Precinct 4 and how many votes did they get?
winner_4 = vote_results["Precinct 4"].max_by{|key, value| value}
puts "5) #{winner_4[0]} won Precinct 4 with #{winner_4[1]} votes."
puts "\n"
# 6) How many people voted in total?
total_count = 0
vote_results.each do |index, results|
  results. each do |candidate, votes|
    total_count += votes
  end
end
puts "6) #{total_count} total people voted in all precincts."
puts "\n"
# 7) Who won the election and how many votes did they get? Use the hash you created in Question 4 to return the answer.
max_candidate_value = candidate_totals.values.max
max_candidate = candidate_totals.key(max_candidate_value)
puts "7) #{max_candidate} won the election with #{max_candidate_value} votes."
puts "\n"
# 8) How many more votes did the winner have as compared to the third place candidate? Use the hash you created in Question 4 and the winning candidate total votes value from Question 7 to complete this question.
min_candidate = candidate_totals.key(candidate_totals.values.min)
min_candidate_value = candidate_totals.values.min
difference = (max_candidate_value) - (min_candidate_value)
puts "8) #{max_candidate} beat #{min_candidate} by #{difference} votes."
