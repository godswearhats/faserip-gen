This is a simple program used for generating random characters for use with the
(long) out-of-print Marvel Super Heroes game, which used the FASERIP system.

To run it, you will need to have a copy of Ruby on your computer. This ships
with a Mac or Linux, or you can install it on Windows from [here](https://rubyinstaller.org/).

Download the file `faserip-gen.rb` to a convenient location, and run it with

    > ruby faserip-gen.rb

If you want to generate a character with a particular form, you can pass that
as an argument to the program.

    > ruby faserip-gen.rb altered
	> ruby faserip-gen.rb mutant
	> ruby faserip-gen.rb hi-tech
	
	# can all be shortened to just the first letter
	> ruby faserip-gen.rb a
	> ruby faserip-gen.rb m
	> ruby faserip-gen.rb h

The output is a character with form, stats and powers. You'll need the original
books to fully understand how to use these and modify them into their final form.

I built this primarily because creating characters took a lot of dice rolling, and
this just sped up that part of the process. Hope you get some use out of it!
