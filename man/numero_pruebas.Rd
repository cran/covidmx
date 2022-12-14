% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/numero_pruebas.R
\name{numero_pruebas}
\alias{numero_pruebas}
\title{Numero de Pruebas}
\usage{
numero_pruebas(
  datos_covid,
  entidades = c("AGUASCALIENTES", "BAJA CALIFORNIA", "BAJA CALIFORNIA SUR", "CAMPECHE",
    "CHIAPAS", "CHIHUAHUA", "CIUDAD DE MÉXICO", "COAHUILA DE ZARAGOZA", "COLIMA",
    "DURANGO", "GUANAJUATO", "GUERRERO", "HIDALGO", "JALISCO", "MÉXICO",
    "MICHOACÁN DE OCAMPO", "MORELOS", "NAYARIT", "NUEVO LEÓN", "OAXACA", "PUEBLA",
    "QUERÉTARO", "QUINTANA ROO", "SAN LUIS POTOSÍ", "SINALOA", "SONORA", "TABASCO",
    "TAMAULIPAS", "TLAXCALA", "VERACRUZ DE IGNACIO DE LA LLAVE", "YUCATÁN", "ZACATECAS"),
  group_by_entidad = TRUE,
  entidad_tipo = c("Unidad Medica", "Residencia", "Nacimiento"),
  fecha_tipo = c("Sintomas", "Ingreso", "Defuncion"),
  tipo_prueba = c("Antigeno", "PCR"),
  group_by_tipo_prueba = TRUE,
  tipo_paciente = c("AMBULATORIO", "HOSPITALIZADO", "NO ESPECIFICADO"),
  group_by_tipo_paciente = FALSE,
  tipo_uci = c("SI", "NO", "NO APLICA", "SE IGNORA", "NO ESPECIFICADO"),
  group_by_tipo_uci = FALSE,
  tipo_sector = c("CRUZ ROJA", "DIF", "ESTATAL", "IMSS", "IMSS-BIENESTAR", "ISSSTE",
    "MUNICIPAL", "PEMEX", "PRIVADA", "SEDENA", "SEMAR", "SSA", "UNIVERSITARIO",
    "NO ESPECIFICADO"),
  group_by_tipo_sector = FALSE,
  defunciones = FALSE,
  edad_cut = NULL,
  as_tibble = TRUE,
  fill_zeros = as_tibble,
  list_name = "numero_pruebas",
  .grouping_vars = c()
)
}
\arguments{
\item{datos_covid}{(\strong{obligatorio}) Lista de \code{tibble}s o \code{duckdb}s resultante de
\code{\link[=descarga_datos_abiertos]{descarga_datos_abiertos()}} o \code{\link[=read_datos_abiertos]{read_datos_abiertos()}}}

\item{entidades}{(\strong{opcional})  Vector con las entidades de las unidades medicas a analizar.
Opciones: \code{AGUASCALIENTES}, \verb{BAJA CALIFORNIA}, \verb{BAJA CALIFORNIA SUR},
\code{CAMPECHE}, \code{CHIAPAS}, \code{CHIHUAHUA}, \verb{CIUDAD DE MEXICO},
\verb{COAHUILA DE ZARAGOZA} , \code{COLIMA}, \code{DURANGO}, \code{GUANAJUATO}, \code{GUERRERO},
\code{HIDALGO}, \code{JALISCO}, \code{MEXICO}, \verb{MICHOACAN DE OCAMPO}, \code{MORELOS},\code{NAYARIT}
\verb{NUEVO LEON}, \code{OAXACA} ,\code{PUEBLA}, \code{QUERETARO},\verb{QUINTANA ROO},
\verb{SAN LUIS POTOSI}, \code{SINALOA}, \code{SONORA}, \code{TABASCO}, \code{TAMAULIPAS},\code{TLAXCALA},
\verb{VERACRUZ DE IGNACIO DE LA LLAVE}, \code{YUCATAN}, \code{ZACATECAS}.}

\item{group_by_entidad}{(\strong{opcional}) \code{TRUE} obtiene los casos para cada entidad reportando
en cada fecha la entidad y los casos en dicha entidad. \code{FALSE}  junta las \code{entidades} sumando
sus casos en una sola observacion por cada fecha.}

\item{entidad_tipo}{(\strong{opcional}) Indica a que se refiere las \code{entidades} seleccionadas. Elige
una de las opciones: \verb{Unidad Medica} (entidad de la unidad medica), \code{Nacimiento}
(entidad de origen del individuo) o \code{Residencia} (entidad donde reside el individuo).}

\item{fecha_tipo}{(\strong{opcional}) Selecciona si la fecha que se utiliza es la fecha de \code{Ingreso}
(si aplica), la fecha de \code{Sintomas} o la de \code{Defuncion} (si aplica). El default es fecha de \code{Sintomas}.}

\item{tipo_prueba}{(\strong{opcional}) Vector con el tipo de pruebas a incluir \code{Antigeno}, \code{PCR}. Por
default se incluyen ambas.}

\item{group_by_tipo_prueba}{(\strong{opcional}) Booleana determinando si regresa la base
con cada entrada agrupada por \code{tipo_prueba}. En caso \code{TRUE} (cada fecha
y entidad reporta separado el los casos de PCR y Antigeno). En caso \code{FALSE} se juntan
los casos de PCR y Antigeno para devolver un unico numero por fecha.}

\item{tipo_paciente}{(\strong{opcional}) Vector con el tipo de pacientes a incluir. Opciones:
\code{AMBULATORIO}, \code{HOSPITALIZADO}, \verb{NO ESPECIFICADO}. Por default se incluyen todos.}

\item{group_by_tipo_paciente}{(\strong{opcional}) Booleana determinando (caso \code{TRUE}) si regresa
la base con cada entrada agrupada por \code{tipo_paciente} (es decir cada fecha
se genera un renglon para \code{AMBULATORIO}, un renglon para \code{HOSPITALIZADO}, etc) o bien
si se suman todos los grupos y cada fecha reporta solo la suma de estos
(estilo \code{AMBULATORIO + HOSPITALIZADO} segun las categorias de \code{tipo_paciente})
El default es \code{FALSE}.}

\item{tipo_uci}{(\strong{opcional})  Vector con el tipo de valores para Unidad de
Cuidado Intensivo (UCI) a incluir:  \code{SI},\code{NO},\verb{NO APLICA},\verb{SE IGNORA},\verb{NO ESPECIFICADO}.
Por default se incluyen todos.}

\item{group_by_tipo_uci}{(\strong{opcional}) Booleana. El caso \code{TRUE} determina si regresa la base
con cada fecha teniendo diferentes renglones uno para cada \code{tipo_uci} (es decir cada fecha
se generan tantos observaciones como grupos de tipo de UCI) o bien en una sola fecha
se suman todos los tipos de UCI (\code{FALSE}). El default es \code{FALSE}.}

\item{tipo_sector}{(\strong{opcional}) Vector con los sectores del sistema de salud a incluir:
\verb{CRUZ ROJA},\code{DIF},\code{ESTATAL},\code{IMSS},\code{IMSS-BIENESTAR},\code{ISSSTE}, \code{MUNICIPAL},\code{PEMEX},
\code{PRIVADA},\code{SEDENA},\code{SEMAR},\code{SSA}, \code{UNIVERSITARIO},\verb{NO ESPECIFICADO}.
Por default se incluyen todos.}

\item{group_by_tipo_sector}{(\strong{opcional}) Booleana determina en el caso de \code{TRUE} si regresa
la base con cada entrada agrupada por \code{tipo_sector} (es decir cada fecha
tiene una entrada con los del \code{IMSS}, una entrada distinta con los de \code{ISSSTE}, etc) o bien
en caso de \code{FALSE} se devuelve una sola entrada por fecha con la suma \code{IMSS + ISSSTE + etc}
segun los  sectores seleccionados. El default es \code{FALSE}.}

\item{defunciones}{(\strong{opcional})  Booleana si incluir sólo defunciones \code{TRUE} o a todos \code{FALSE}.
El default es \code{FALSE}.}

\item{edad_cut}{(\strong{opcional}) Vector con secuencia de edades para hacer grupos. Por ejemplo
\code{edad_cut = c(0, 10, Inf)} arma dos grupos de edad de 0 a 10 y de 10 a infinito o bien
\code{edad_cut = c(15, 20)} deja sólo los registros entre 15 y 20 años. Por default es \code{NULL}
y no arma grupos etarios.}

\item{as_tibble}{(\strong{opcional}) Regresar como \code{tibble} el resultado. En caso de que \code{as_tibble}
sea \code{FALSE} se devuelve como conexion en \code{duckdb}. Se recomienda el default (\code{tibble}).}

\item{fill_zeros}{(\strong{opcional}) En caso de que el resultado sea un \code{tibble} regresa
observaciones para todas las combinaciones de variables incluyendo como 0 aquellas fechas
cuando no se observaron casos. En caso contrario no se incluyen las filas donde no se
observaron casos.}

\item{list_name}{(\strong{opcional}) Asigna un nombre en la lista de datos a la base generada}

\item{.grouping_vars}{(\strong{opcional}) Vector de variables adicionales de agrupacion de los
conteos. Por ejemplo si se agrega \code{.grouping_vars = 'DIABETES'} entonces para cada fecha habra
dos conteos de casos uno de los que tienen diabetes y uno de los que no.}
}
\value{
Adiciona a la lista de \code{datos_covid} una nueva entrada de nombre \code{list_name}
(default: \code{numero_pruebas}) con una base de datos (\code{tibble} o \code{duckdb}) con los
resultados agregados.
\itemize{
\item numero_pruebas - Base de datos generara con los datos agregados (el nombre cambia si
se usa \code{list_name}).
\item dict - Diccionario de datos
\item dats - Datos originales (conexion a \code{duckdb} o \code{tibble})
\item disconnect  - Función para desconectarte de \code{duckdb}
\item ... - Cualquier otro elemento que ya existiera en \code{datos_covid}
}
}
\description{
\code{numero_pruebas} Calcula el numero total de pruebas por fecha agrupando (o sin hacerlo)
por covariables. Por default calcula la el numero de pruebas de antigeno y PCR por separado
para cada estado.
}
\details{
Las pruebas de PCR (polymerase chain reaction) identifican material genetico de un organismo
(por ejemplo un virus como el COVID-19 o la influenza). Las pruebas de antigeno
(o pruebas rapidas) detectan algunas proteinas que conforman el virus.

Para mas informacion sobre las pruebas y su interpretacion puedes consultar
\href{https://espanol.cdc.gov/coronavirus/2019-ncov/symptoms-testing/testing.html}{las guias del CDC}
}
\examples{

# Para el ejemplo usaremos los datos precargados (datosabiertos) pero tu puedes
# correr el ejemplo descargando informacion mas reciente.
datos_covid <- datosabiertos

# Número de pruebas PCR/Antigeno a nivel nacional por estado
datos_covid <- datos_covid |> numero_pruebas()
head(datos_covid$numero_pruebas)

# Número de pruebas nacionales pero sin separar por tipo ni estado
datos_covid <- datos_covid |>
  numero_pruebas(
    group_by_entidad = FALSE, group_by_tipo_prueba = FALSE,
    list_name = "Todas_las_pruebas"
  )
head(datos_covid$Todas_las_pruebas)

# Positivos en Baja California Sur
datos_covid <- datos_covid |>
  numero_pruebas(
    entidades = c("BAJA CALIFORNIA SUR"),
    list_name = "BCS"
  )
head(datos_covid$BCS)

# Si deseas agrupar por una variable que no este en las opciones asi como tipo paciente
datos_covid <- datos_covid |>
  numero_pruebas(
    tipo_paciente = c("AMBULATORIO", "HOSPITALIZADO"),
    group_by_tipo_paciente = TRUE,
    .grouping_vars = c("DIABETES"),
    list_name = "pruebas_diabetes"
  )
head(datos_covid$pruebas_diabetes)

# Una vez hayas concluido tu trabajo no olvides desconectar
datos_covid$disconnect()
}
