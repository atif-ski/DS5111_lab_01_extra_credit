default:
	@cat makefile
# Get raw data from URL: 
pg1065.txt:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt 

# include ONLY the lines that include any upper/lower combination of raven, (Raven, RAVEN etc)raven_lines.txt:
	cat pg1065.txt| grep -i 'raven' >raven_lines.txt

# Here include a count of the lines including the word Raven, note the upper and lower case
number_of_Raven.txt:
	cat pg1065.txt| grep -w  'Raven' | wc -l > number_of_Raven.txt

# Here include a count of the lines including the word RAVEN, note the upper and lower case
number_of_RAVEN.txt:
	cat pg1065.txt| grep -w  'RAVEN' | wc -l > number_of_RAVEN.txt

# Here include a count of the lines including the word raven, note the upper and lower case
number_of_raven.txt:
	cat pg1065.txt| grep -w  'raven' | wc -l > number_of_raven.txt

# This creates all files

make_all: pg1065.txt raven_lines.txt number_of_Raven.txt number_of_RAVEN.txt number_of_raven.txt

# Remove all files generated
.PHONY: clean
clean:
	rm *.txt

