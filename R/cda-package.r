##' Coupled dipole approximation in electromagnetic scattering
##'
##' Solves the electromagnetic problem of coupled-dipoles (scattering and absorption by a cluster of subwavelength particles in arbitrary 3D configuration) by direct inversion of the interaction matrix. Functions are provided for linear polarisation with varying angle of incidence, as well as circular polarisation with angular averaging (optical activity). Retardation is included in the interaction.
##'
##' 
##' @name cda-package
##' @docType package
##' @useDynLib cda
##' @import Rcpp
##' @title cda
##' @keywords package
##' @author baptiste Auguie
##' @references
##' Draine BT. The discrete-dipole approximation and its application to interstellar graphite grains. Astrophysical Journal. 1988.
##' 
##' Schatz GC, Duyne RP. Discrete dipole approximation for calculating extinction and Raman intensities for small particles with arbitrary shapes. Journal of Chemical Physics. 1995.
##' 
##' Gunnarsson L, Zou S, Schatz GC, et al. Confined plasmons in nanofabricated single silver particle pairs: Experimental observations of strong interparticle interactions. Journal of Physical Chemistry B. 2005.
##' 
##' ## Any one of the following references should be used to cite and acknowledge the use of this package.
##' 
##' Circular dichroism:
##' 
##' B. Auguie, J.L. Alonso-Gomez, A. Guerrero-Martinez, L.M. Liz-Marzan. Fingers crossed: circular dichroism with a dimer of plasmonic nanorods. J. Phys. Chem. Lett. 2, (2011)
##' 
##' Linear extinction:
##' 
##' B. Auguie, W.L. Barnes. Diffractive coupling in gold nanoparticle arrays and the effect of disorder. Optics Letters (2009)
##' 
##' Array factor (infinite case):
##' 
##' B. Auguie, W.L. Barnes. Collective resonances in gold nanoparticle arrays. Physical Review Letters (2008)
##' @keywords packagelibrary
##' 
NULL

##' Rcpp module: array
##' 
##' Exposes a C++ calculation of the array factor.
##' @name array
##' @docType data
##' @export
##' @details
##' \itemize{
##'  \item{array_factor}{ truncated lattice sum for a finite 2D square array}
##' }
##' @examples
##' show( array )
NULL

##' Rcpp module: cd
##' 
##' Exposes a calculation of orientation-averaged circular dichroism within the coupled-dipole approximation.
##' @name cd
##' @docType data
##' @export
##' @details
##' \itemize{
##'  \item{circular_dichroism_spectrum}{Loop over wavelenghts and calculate the orientation averaging of the difference in extinction, absorption, scattering for left/right circularly polarised light}
##' }
##' @examples
##' show( cd )
NULL

##' Rcpp module: cda
##' 
##' Exposes basic C++ functions used in the coupled-dipole approximation.
##' @name cda
##' @docType data
##' @export
##' @details
##' \itemize{
##'   \item{absorption}{absorption cross-section}
##'   \item{euler}{ 3D rotation matrix parametrized by Euler angles }
##'   \item{extinction}{ extinction cross-section }
##'   \item{interaction_matrix}{ build the coupled-dipole interaction matrix }
##' }
##' @examples
##' show( cda )
NULL

##' Rcpp module: linear
##' 
##' Exposes C++ calculation of scattering and absorption of dipolar particles by linearly polarised light in fixed orientation.
##' @name linear
##' @docType data
##' @export
##' @details
##' \itemize{
##'   \item{linear_extinction_spectrum}{Returns extinction spectra for x and y polarisation at one fixed incidence } 
##'   \item{dispersion}{Returns absorption and extinction cross-sections for x and y polarisation at multiple angles of incidence, fixed wavelength (subroutine)} 
##'   \item{dispersion_spectrum}{Returns absorption and extinction spectra for x and y polarisation at multiple angles of incidence.} 
##' }
##' @examples
##' show( linear )
NULL

##' Lattice sum
##' 
##' Converged lattice sum G0 for an infinite 2D array of dipoles at normal incidence
##' @name G0
##' @aliases gfun
##' @docType data
##' @details
##' The calculation was made using code from Prof. J. G. de Abajo (CSIC, Spain)
##' @format
##'   \describe{
##'    \item{\code{wavelength}}{a numeric vector}
##'    \item{\code{Qx}}{a numeric vector}
##'    \item{\code{Gxx}}{a complex vector}
##'  }
##' @examples
##' data(G0)
##' \dontrun{demo(lattice_sum)}
NULL


##' Rcpp module: dispersion
##' 
##' Exposes C++ calculation of scattering and absorption of dipolar particles by linearly polarised light in fixed orientation.
##' @name dispersion
##' @docType data
##' @export
##' @details
##' \itemize{
##'   \item{linear_extinction_spectrum}{Returns extinction spectra for x and y polarisation at one fixed incidence } 
##'   \item{dispersion}{Returns absorption and extinction cross-sections for x and y polarisation at multiple angles of incidence, fixed wavelength (subroutine)} 
##'   \item{dispersion_spectrum}{Returns absorption and extinction spectra for x and y polarisation at multiple angles of incidence.} 
##' }
##' @examples
##' show( dispersion )
NULL