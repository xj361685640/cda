##' creates an rgl ellipsoid
##'
##' deforms, rotate, and translate a sphere
##' @title rgl.ellipsoid
##' @param x x
##' @param y y
##' @param z z
##' @param a axis
##' @param b axis
##' @param c axis
##' @param phi phi
##' @param theta theta
##' @param psi psi
##' @param subdivide subdivision
##' @param smooth smoothing
##' @param ... additional params 
##' @return an rgl mesh 
##' @author baptiste Auguié
##' @examples
##' \dontrun{ require(rgl) ;  ee <- rgl.ellipsoid()
##' shapelist3d(ee) }

rgl.ellipsoid <- function (x=0,y=0,z=0, a = 1,b=1,c=1, phi=0,theta=0,psi=0,
                       subdivide = 3, smooth = TRUE, ...) 
{
  
    sphere <- rgl::subdivision3d(cube3d(...), subdivide)
    class(sphere) <- c("mesh3d","shape3d")

    norm <- sqrt(sphere$vb[1, ]^2 + sphere$vb[2, ]^2 + sphere$vb[3, 
        ]^2)
    for (i in 1:3) sphere$vb[i, ] <- sphere$vb[i, ]/norm
    sphere$vb[4, ] <- 1
    sphere$normals <- sphere$vb
    result <- rgl::scale3d(sphere, a,b,c)
    rotM <- cda$euler(phi,theta,psi)
    result <- rgl::rotate3d(result,matrix=rotM)
    result <- rgl::translate3d(result, x,y,z)
    invisible(result)
}
##' Create a list of rgl ellipsoids oriented in space
##'
##' each ellipsoid is specified by its position, dimensions, and Euler angles
##' @title rgl.ellipsoids
##' @param positions matrix of positions
##' @param sizes matrix of axis lengths
##' @param angles matrix of Euler angles
##' @param ... additional params
##' @return rgl mesh
##' @author baptiste Auguié
##' @examples
##' cl <- helix(0.5, 1, 36, delta=pi/6, n.smooth=1e3)
##' sizes <- clust.equalsizes(0.04,0.02,0.02,NROW(cl$positions))
##' \dontrun{ require(rgl) ; rgl.ellipsoids(cl$positions, sizes, cl$angles, col="gold") }
rgl.ellipsoids <- function(positions, sizes, angles,...){

  N <- NROW(positions)
  ll <- lapply(seq(1,N), function(ii)
               rgl.ellipsoid(positions[ii,1],positions[ii,2],positions[ii,3],
                         sizes[ii,1],sizes[ii,2],sizes[ii,3],
                         angles[ii,1],angles[ii,2],angles[ii,3], ...))
  
  rgl::shapelist3d(ll,...)
  
}






