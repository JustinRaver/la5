#!/usr/bin/awk -f

# Author: Justin Raver
#Class: CS354
#Semester: Spring 2021

BEGIN {
    FPAT = "([^,]+)|(\"[^\"]+\")"
	##Print the HTML start tags and the table column info
	print "<html> \n\n<head> \n<title>Ada Single Family Homes</title>\n</head>\n\n<body>\n<h1>Ada Single Family Home Data<\h1>\n"
	print "<table>\n"
	print "<tr> <th> IssueDate: </th><th> Subdivision: </th> <th> Lot: </th> <th> Block: </th> <th> Value: </th> </tr>" 
}
# convert the 3rd column to lower to be checked against regex
tolower($3) ~ /single.*family.*dwelling.*/{

	# Check for the number of colums
	if(NF == 8){
		# get rid of the "" from the price
		sub(/\"/,"",$8)
		sub(/\"/,"",$8)

		# print the html table with data
		print "<tr>\n"
		print "<td >" $1 "</td>\n"	
		print "<td style=\"padding: 0 2% 0 2%\">" $5 "</td>\n"	
		print "<td >" $6 "</td>\n"	
		print "<td >" $7 "</td>\n"	
		print "<td>" $8 "</td>\n"	
		print "</tr>\n"
	}else{
		# get rid of the "" from the price
		sub(/\"/,"",$6)
		sub(/\"/,"",$6)

		# print the html table with data
		print "<tr>\n"
		print "<td >" $1 "</td>\n"	
		print "<td style=\"padding: 0 2% 0 2%\">" $5 "</td>\n"	
		print "<td > N/A </td>\n"	
		print "<td > N/A </td>\n"	
		print "<td >" $6 "</td>\n"	
		print "</tr>\n"
	}
}

END {
	# print the html end tags
	print "</table>\n\n </body>\n<html>\n"
}

