### --------------------------------------------------------------
### AUTOMATED DATA COLLECTION WITH R
### SIMON MUNZERT, CHRISTIAN RUBBA, PETER MEISSNER, DOMINIC NYHUIS
###
### CODE CHAPTER 4: XPATH
### PROBLEM SOLUTIONS
### --------------------------------------------------------------


#1. What makes XPath a domain-specific language?
Syntactically and structurally, XPath is domain-specific, meaning that the language has been designed for working on the domain of tree-structured XML documents. 

XPath works on both because HTML can be described as a subset or variant of the more general XML.

fortunes1 <- htmlParse("fortunes/fortunes1.html")
gentleman <- xpathSApply(fortunes1, "//a[text()[contains(., 'R-help')]]/ancestor::body/div[1]/h1", xmlValue)

xpathSApply(fortunes1, "//div[substring-before(./@date, '/')='October']")

The first expression (//div//p) defines a more narrow set of elements since it requires a p node to have a div ancestor, while the second expression makes no such restriction

xpathSApply(fortunes1, "//i")

The expression does not exclusively identify the quote information since the address information uses italic tags as well to mark-up the hyperlink text. 

potus <- xmlParse("potus/potus.xml")

xpathSApply(potus, "//document/president/name", xmlValue)

xpathSApply(potus, "//document/president[./number>39]/name", xmlValue)

xpathSApply(potus, "//document/president[./party='Republican']/occupation", xmlValue)

xpathSApply(potus, "//document/president[./party='Republican' and ./religion='Baptist']/occupation", xmlValue)

removeWhitespace <- function(x){
	require(stringr)
	x <- xmlValue(x)
	x <- str_trim(x)
	return(x)
}

xpathSApply(potus, "//document/president/occupation", removeWhitespace)

eduFun <- function(x){
	x <- xmlValue(x)
	x <- ifelse(x=="No formal education", NA, x)
	return(x)
}

xpathSApply(potus, "//document/president/education", eduFun)

eduFun <- function(x){
	x <- xmlValue(x)
	x <- ifelse(x=="No formal education", NA, x)
	return(x)
}

xpathSApply(potus, "//document/president/education", eduFun)