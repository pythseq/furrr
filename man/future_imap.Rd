% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/future-imap.R, R/future-walk.R
\name{future_imap}
\alias{future_imap}
\alias{future_imap_chr}
\alias{future_imap_dbl}
\alias{future_imap_int}
\alias{future_imap_lgl}
\alias{future_imap_raw}
\alias{future_imap_dfr}
\alias{future_imap_dfc}
\alias{future_iwalk}
\title{Apply a function to each element of a vector, and its index via futures}
\usage{
future_imap(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_chr(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_dbl(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_int(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_lgl(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_raw(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_dfr(
  .x,
  .f,
  ...,
  .id = NULL,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_imap_dfc(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)

future_iwalk(
  .x,
  .f,
  ...,
  .options = furrr_options(),
  .env_globals = parent.frame(),
  .progress = FALSE
)
}
\arguments{
\item{.x}{A list or atomic vector.}

\item{.f}{A function, formula, or vector (not necessarily atomic).

If a \strong{function}, it is used as is.

If a \strong{formula}, e.g. \code{~ .x + 2}, it is converted to a function. There
are three ways to refer to the arguments:
\itemize{
\item For a single argument function, use \code{.}
\item For a two argument function, use \code{.x} and \code{.y}
\item For more arguments, use \code{..1}, \code{..2}, \code{..3} etc
}

This syntax allows you to create very compact anonymous functions.

If \strong{character vector}, \strong{numeric vector}, or \strong{list}, it is
converted to an extractor function. Character vectors index by
name and numeric vectors index by position; use a list to index
by position and name at different levels. If a component is not
present, the value of \code{.default} will be returned.}

\item{...}{Additional arguments passed on to the mapped function.}

\item{.options}{The \code{future} specific options to use with the workers. This
must be the result from a call to \code{\link[=furrr_options]{furrr_options()}}.}

\item{.env_globals}{The environment to look for globals required by \code{.x} and
\code{...}. Globals required by \code{.f} are looked up in the function environment
of \code{.f}.}

\item{.progress}{A single logical. Should a progress bar be displayed?
Only works with multisession, multicore, and multiprocess futures. Note
that if a multicore/multisession future falls back to sequential, then
a progress bar will not be displayed.

\strong{Warning:} The \code{.progress} argument will be deprecated and removed
in a future version of furrr in favor of using the more robust
\href{https://CRAN.R-project.org/package=progressr}{progressr}
package.}

\item{.id}{Either a string or \code{NULL}. If a string, the output will contain
a variable with that name, storing either the name (if \code{.x} is named) or
the index (if \code{.x} is unnamed) of the input. If \code{NULL}, the default, no
variable will be created.

Only applies to \verb{_dfr} variant.}
}
\value{
A vector the same length as .x.
}
\description{
These functions work exactly the same as \code{\link[purrr:imap]{purrr::imap()}} functions,
but allow you to map in parallel.
}
\examples{
\donttest{plan(multiprocess)}

future_imap_chr(sample(10), ~ paste0(.y, ": ", .x))

\dontshow{
# Close open connections for R CMD Check
if (!inherits(plan(), "sequential")) plan(sequential)
}
}
