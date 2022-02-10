#'
#'
#'
#'
#' @param massa altura da massa: fina, media ou alta
#' @param quantidade quantas pizzas se quer fazer
#'
#' @examples
#' pizzar("media", 3)
#'
#' @export
pizzar <- function(massa, quantidade) {

  tipo <- c("fina", "media", "alta")
  farinha <- c(130, 200, 240)
  agua <- c(84, 130, 157)
  sal <- c(8 / 3, 4, 5)
  fermento <- c(1, 5 / 3, 2)

  a <- tibble::tibble(tipo, farinha, agua, sal, fermento) |>
    dplyr::filter(tipo == massa) |>
    dplyr::mutate(farinha = round(farinha * quantidade, 0),
                  agua = round(agua * quantidade, 0),
                  sal = round(sal * quantidade, 0),
                  fermento = round(fermento * quantidade, 0))

  glue::glue(
    "Para fazer suas {quantidade} pizzas {massa}s, de 35 cm, você precisará de {a[1,2]} gr de farinha,
    {a[1,3]} ml de água, {a[1,4]} gr sal e {a[1,5]} gr de fermento biológico seco.

    Misture primeiro a farinha, o sal e o fermento, depois, aos poucos, a água.

    BOM APETITE!"
  )


}
