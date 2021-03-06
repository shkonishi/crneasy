% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/igplot.R
\name{igplot}
\alias{igplot}
\title{simple plot of igraph object}
\usage{
igplot(g, lay, connected, v.l, v.l.c, v.l.cx, v.f.c, v.s, v.c, v.l.f, v.shp,
    e.c, e.w, e.lty, ...)
}
\arguments{
\item{g}{igraph object}

\item{lay}{layout function of igraph, if 'lay="all"', all layout functions were performed.}

\item{connected}{logical: default is true, connected vertex was shown.}

\item{v.c, v.f.c, v.l, v.l.c, v.l.cx, v.s, v.l.f, v.shp, }{vertex parameters, v.c(vertex.color), v.f.c(vertex.frame.color), v.l(vertex.label), v.l.c(vertex.label.color), v.l.cx(vertex.label.cex), v.s(vertex.size), v.l.f(vertex.label.family), v.shp(vertex.shape)}

\item{e.c, e.w, e.lty}{edge parameters, e.c(edge.color), e.w(edge.width), e.lty(edge.lty)}

\item{...}{other arguments of plot.igraph. E.g. margin, frame, and main}
}
\description{
Shortening several 'plot.igraph' options, and these has initial value.
}
\examples{
# sample data
dat <- data.frame(
 S1 = c(43.26, 166.6, 12.53, 28.77, 114.7, 119.1, 118.9, 3.76, 32.73, 17.46),
 S2 = c(40.89, 41.87, 39.55, 191.92, 79.7, 80.57, 156.69, 2.48, 11.99, 56.11),
 S3 = c(5.05, 136.65, 42.09, 236.56, 99.76, 114.59, 186.95, 136.78, 118.8, 21.41)
 )
rownames(dat) <- paste0("G", 1:10)

# correlation matrix
cormat <- round(cor(t(dat)),2)

# threshold graph
res <- cornet::corgraph(mat=cormat)
g1 <- res[[1]]
cornet::igplot(g=g1, v.s=15)

# complete graph
g2 <- cornet::matoedge(cormat)
 ewid <- abs(igraph::E(g2)$weight)
 ecol <-  ifelse(igraph::E(g2)$weight < 0 , "steelblue3", "grey80")
cornet::igplot(g = g2, lay=igraph::layout.circle, v.s = 15, e.c = ecol, e.w = ewid*4)
}
