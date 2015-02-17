#' Extract the text
#'
#' @inheritParams xml_name
#' @return A character vector, the same length as x.
#' @examples
#' x <- xml_parse("<p>This is some text. This is <b>bold!</b></p>")
#' xml_text(x)
#' xml_text(xml_children(x))
#' @export
xml_text <- function(x, ...) {
  UseMethod("xml_text")
}

#' @export
xml_text.xml_doc <- function(x, ...) {
  node_text(doc_root(x$doc))
}

#' @export
xml_text.xml_node <- function(x, ...) {
  node_text(x$node)
}

#' @export
xml_text.xml_nodeset <- function(x, ...) {
  vapply(x, xml_text, ..., FUN.VALUE = character(1))
}