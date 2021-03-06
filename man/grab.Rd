% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grab.R
\name{grab}
\alias{grab}
\title{Grab Regular Expressions from Dictionaries}
\usage{
grab(pattern, dictionary = getOption("regex.library"))
}
\arguments{
\item{pattern}{A character string starting with \code{"@"} that is a regular 
expression from a \pkg{qdapRegex} dictionary.}

\item{dictionary}{A dictionary of canned regular expressions to search within.}
}
\value{
Returns a single string regular expression from one of the 
\pkg{qdapRegex} dictionaries.
}
\description{
convenience function to
}
\details{
Many R regular expressions contain doubled backslashes that are not 
used in other regex interpreters.  Using \code{\link[base]{cat}} can remove 
backslash escapes (see \bold{Examples}) or \code{\link[utils]{URLencode}}
if using in a url.
}
\examples{
grab("@rm_white")
\dontrun{
## Throws an error
grab("@foo")
}
cat(grab("@pages2"))
\dontrun{
cat(grab("@pages2"), file="clipboard")
}
}
\keyword{get}
\keyword{grab}

