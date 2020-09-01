#' Identify all potential start and stop codons in a nucleotide sequence
#' @description This function scans a nucleotide sequence of interest
#' in the search of canonical start codon ATG or non-canonical start
#' codons GTG, TTG and CTG as well as canonical stop codons TAA, TAG and TGA.
#' @param x character string giving the nucleotide sequence.
#' @return list of potential start and stop codons with their coordinates.
#' @author Vasily V. Grinev
#' @examples
#' codons = codonStartStop(x = "AAAATGGCATGGTAAGTC")
#' @export

codonStartStop <- function(x){
  ##  Loading of required auxiliary library.
  #   This code was successfully tested with library Biostrings v.2.52.0.
  #suppressMessages(expr = library(package = Biostrings))
  ### Calculation of codon positions.
  codons <- DNAStringSet(x = c("ATG", "GTG", "TTG", "CTG", "TAA", "TAG", "TGA"))
  names(x = codons) <- as.character(x = codons)
  codonPositions <- sort(x = unlist(x = matchPDict(pdict = codons,
                                                  subject = DNAString(x = x))))
  codonPositions <- list(start(codonPositions), names(x = codonPositions))
  ### Returning a final object of class list.
  return(codonPositions)
}
