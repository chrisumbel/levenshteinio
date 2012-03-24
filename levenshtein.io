/*
Copyright (c) 2012, Chris Umbel

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
*/

Matrix := List clone
matrix := method(m, n,
    new := Matrix clone
    new append(Vector clone setSize(n + 1) rangeFill)

    for(i, 1, m, 
        new append(Vector clone setSize(n + 1))
        new at(i) atPut(0, i)
    )

    new
)

defaultSettings := Object clone
defaultSettings costInsert := 1
defaultSettings costDelete := 1
defaultSettings costSubstitute := 2

Sequence levenshteinDistanceFrom := method(target, settings,
    settings = if(settings, settings, defaultSettings)
    source := self
    distanceMatrix := matrix(source size, target size)

    for(i, 1, source size, 
        for(j, 1, target size, 
            costInsert := distanceMatrix at(i - 1) at(j) + settings costInsert
            costDelete := distanceMatrix at(i) at(j - 1) + settings costDelete

            costSubstitute := distanceMatrix at(i - 1) at (j - 1) + if(
                source at(i - 1) != target at(j -1), 
                settings costSubstitute, 
                0
            )

            distanceMatrix at(i) atPut(j, costSubstitute min(costDelete) min(costInsert))
        )
    )

    distanceMatrix at(source size) at(target size)
)
