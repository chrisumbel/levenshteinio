
levenshteinio
=============

A Levenshtein distance implementation for the Io programming language.

Example
-------

	doFile("levenshtein.io")
	"intention" levenshteinDistanceFrom("execution") println

produces the output

	8

The weights of the three edit operations can be adjusted with a settings object.

	levenshteinSettings := Object clone
	levenshteinSettings costInsert := 1
	levenshteinSettings costDelete := 1
	levenshteinSettings costSubstitute := 1

	"intention" levenshteinDistanceFrom("execution", levenshteinSettings) println
	
which produces

	5

License
=======

Copyright (c) 2011, Chris Umbel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
