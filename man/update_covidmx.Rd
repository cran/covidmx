% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update_covidmx.R
\name{update_covidmx}
\alias{update_covidmx}
\title{Actualiza el paquete covidmx}
\usage{
update_covidmx(quiet = FALSE, force = FALSE, ...)
}
\arguments{
\item{quiet}{(\strong{opcional}) Determina si instalar en silencio}

\item{force}{(\strong{opcional}) Determina si forzar la reinstalacion}

\item{...}{(\strong{opcional}) Parametros adicionales para \code{\link[remotes:install_github]{remotes::install_github()}}}
}
\value{
Ningún valor. Se llama para actualizar el paquete a la versión más reciente desde Github.
}
\description{
Descarga e instala la version mas reciente de covidmx desde Github
\url{https://github.com/RodrigoZepeda/covidmx}
}
\note{
Actualiza el paquete instalando todas las dependencias necesarias.
}
\examples{
\dontrun{
# Actualiza el paquete de coivdmx de Github | Updates the covidmx package from Github
update_covidmx()
}

}
