\encoding{utf8}
\name{conover.test}
\alias{Conover-Iman test}
\alias{conover.test}
\alias{p.adjustment.methods}
\concept{Conover-Iman test}
\concept{nonparametric pairwise multiple comparisons}
\title{Conover-Iman Test}
\description{Performs the Conover-Iman test of multiple comparisons using rank sums}
\usage{
conover.test  (x, g=NA, method=p.adjustment.methods, kw=TRUE, label=TRUE, 
      wrap=FALSE, table=TRUE, list=FALSE, rmc=FALSE, alpha=0.05)

p.adjustment.methods
# c("none", "bonferroni", "sidak", "holm", "hs", "hochberg", "bh", "by")
}
\arguments{
 \item{x}{a numeric vector, or a list of numeric vectors.  Missing values are ignored.  If the former, then groups \emph{must} be specified using \code{g}.}
 \item{g}{a factor variable, numeric vector, or character vector indicating group.  Missing values are ignored.}
 \item{method}{adjusts the \emph{p}-value for multiple comparisons using the Bonferroni, \enc{Šidák}{Sidak}, Holm, Holm-\enc{Šidák}{Sidak}, Hochberg, Benjamini-Hochberg, or Benjamini-Yekutieli adjustment (see Details).  The default is no adjustment for multiple comparisons.}
 \item{kw}{if \option{TRUE} then the results of the Kruskal-Wallis test are reported.}
 \item{label}{if \option{TRUE} then the factor labels are used in the output table.}
 \item{wrap}{does not break up tables to maintain nicely formatted output.  If \option{FALSE} then output of large tables is broken up across multiple pages.}
 \item{table}{outputs results of the Conover-Iman test in a table format, as qualified by the \code{label} and \code{wrap} options.}
 \item{list}{outputs results of the Conover-Iman test in a list format.}
 \item{rmc}{if \option{TRUE} then the reported test statistics and table are based on row minus column, rather than the default column minus row (i.e. the signs of the test statistic are flipped).}
 \item{alpha}{the nominal level of significance used in the step-up/step-down multiple comparisons procedures (Holm, Holm-\enc{Šidák}{Sidak}, Hochberg, Benjamini-Hochberg, and Benjamini-Yekutieli).}
}
\details{\code{conover.test} computes the Conover-Iman test (Conover and Iman, 1979; Conover, 1999) for stochastic dominance and reports the results among multiple pairwise comparisons after a Kruskal-Wallis test for stochastic dominance among \emph{k} groups (Kruskal and Wallis, 1952).  Pairwise comparison using the Conover-Iman test is valid if and only if the corresponding Kruskal-Wallis null hypothesis is rejected, but is strictly more powerful than Dunn's (1964) \emph{post hoc} multiple comparisons test.  The interpretation of stochastic dominance requires an assumption that the \acronym{CDF} of one group does not cross the \acronym{CDF} of the other.  \code{conover.test} makes \emph{m} = \emph{k}(\emph{k}-1)/2 multiple pairwise comparisons based on the Conover-Iman \emph{t}-test-statistic for the rank-sum differences.  The null hypothesis for each pairwise comparison is that the probability of observing a randomly selected value from the first group that is larger than a randomly selected value from the second group equals one half; this null hypothesis corresponds to that of the Wilcoxon-Mann-Whitney rank-sum test.  Like the rank-sum test, if the data can be assumed to be continuous, and the distributions are assumed identical except for a difference in location, the Conover-Iman test may be understood as a test for median difference.  \code{conover.test} accounts for tied ranks.

\code{conover.test} outputs both \emph{t}-test-statistics for each pairwise comparison and the \emph{p}-value = P(\emph{T} \eqn{\ge} |\emph{t}|) for each, so one would reject Ho if \emph{p} \eqn{\le} \eqn{\alpha}/2. IMPORTANT NOTE: the \emph{p}-values just described are sometimes called "one-sided," (i.e. you get "two-sided" \emph{p}-values by multiplying the one-sided \emph{p}-values by two; notice that \emph{p} \eqn{\le} \eqn{\alpha}/2 and 2\emph{p} \eqn{\le} \eqn{\alpha} are equivalent rejection decisions).

Several options are available to adjust \emph{p}-values for multiple comparisons, including methods to control the family-wise error rate (\acronym{FWER}) and methods to control the false discovery rate (\acronym{FDR}):

\code{"none"} no adjustment is made.  
   
\code{"bonferroni"} the \acronym{FWER} is controlled using Dunn's (1961) Bonferroni adjustment, and adjusted \emph{p}-values = max(1, \emph{pm}).  
   
\code{"sidak"} the \acronym{FWER} is controlled using Šidák's (1967) adjustment, and adjusted \emph{p}-values = max(1, 1 - (1 - \emph{p})^\emph{m}).  
   
\code{"holm"} the \acronym{FWER} controlled using Holm's (1979) progressive step-up procedure to relax control on subsequent tests.  \emph{p} values are ordered from smallest to largest, and adjusted \emph{p}-values = max[1, \emph{p}(\emph{m}+1-\emph{i})], where \emph{i} indexes the ordering.  All tests after and including the first test to not be rejected at the \option{alpha/2} level are not rejected.  
   
\code{"hs"} the \acronym{FWER} is controlled using the Holm-Šidák adjustment (Holm, 1979): another progressive step-up procedure but assuming dependence between tests.  \emph{p} values are ordered from smallest to largest, and adjusted \emph{p}-values = max[1, 1 - (1 - \emph{p})^(\emph{m}+1-\emph{i})], where \emph{i} indexes the ordering.  All tests after and including the first test to not be rejected at the \option{alpha/2} level are not rejected.  
   
\code{"hochberg"} the \acronym{FWER} is controlled using Hochberg's (1988) progressive step-down procedure to increase control on successive tests.  \emph{p} values are ordered from largest smallest, and adjusted \emph{p}-values = max[1, \emph{p}*\emph{i}], where \emph{i} indexes the ordering.  All tests after and including the first to be rejected at the \option{alpha/2} level are rejected.  
   
\code{"bh"} the \acronym{FDR} is controlled using the Benjamini-Hochberg adjustment (1995), a step-down procedure appropriate to independent tests or tests that are positively dependent.  \emph{p}-values are ordered from largest to smallest, and adjusted \emph{p}-values = max[1, \emph{pm}/(\emph{m}+1-\emph{i})], where \emph{i} indexes the ordering.  All tests after and including the first to be rejected at the \option{alpha/2} level are rejected.  
   
\code{"by"} the \acronym{FDR} is controlled using the Benjamini-Yekutieli adjustment (2011), a step-down procedure appropriate to dependent tests.  \emph{p}-values are ordered from largest to smallest, and adjusted \emph{p}-values = max[1, \emph{pmC}/(\emph{m}+1-\emph{i})], where \emph{i} indexes the ordering, and the constant \emph{C} = 1 + 1/2 + .  .  .  + 1/\emph{m}.  All tests after and including the first to be rejected at the \option{alpha/2} level are rejected.  

Because the sequential step-up/step-down tests rejection decisions depend on both the \emph{p}-values and their ordering, those tests rejected using \code{"holm"}, \code{"hs"}, \code{"hochberg"}, \code{"bh"}, or \code{"by"} at the \option{alpha/2} level have an asterisk placed immediately after the adjusted \emph{p}-value in the output.  In all likelihood, datasets used for multiple comparisons will be dependent, but other adjustment procedures are included against the possibility of study designs producing data that may be independent.  
}
\value{
\code{conover.test} returns:
 \item{chi2}{a scalar of the Kruskal-Wallis test statistic adjusted for ties.}
 \item{T}{a vector of all \emph{m} of the Conover-Iman \emph{t} test statistics.}
 \item{P}{a vector of \emph{p}-values corresponding to \code{T}.}
 \item{P.adjust}{a vector of \emph{p}-values corresponding to \code{T}, but adjusted for multiple comparisons as per \code{method} (\code{P} = \code{P.adjust} if \code{method}=\code{"none"}).}
 \item{comparisons}{a vector of strings labeling each pairwise comparison, as qualified by the \code{rmc} option, using either the variable values, or the factor labels or (or factor values if unlabeled). These labels match the corresponding position in the \code{T}, \code{P}, and \code{P.adjust} vectors.}
 }
\author{
Alexis Dinno (\email{alexis.dinno@pdx.edu})
}
\references{
Benjamini, Y. and Hochberg, Y.  (1995)  Controlling the False Discovery Rate: A Practical and Powerful Approach to Multiple Testing. \emph{Journal of the Royal Statistical Society.  Series B (Methodological)}.  \bold{57}, 289--300.  

Benjamini, Y.  and Yekutieli, D.  (2001)  The control of the false discovery rate in multiple testing under dependency. \emph{Annals of Statistics}.  \bold{29}, 1165--1188.  

Conover, W. J. and Iman, R. L. (1979)  On multiple-comparisons procedures.  Technical Report LA-7677-MS, Los Alamos Scientific Laboratory.

Conover, W. J. (1999) \emph{Practical Nonparametric Statistics.}  Wiley, Hoboken, NJ. 3rd edition.
 
Dunn, O.  J.  (1961)  Multiple comparisons among means.  \emph{Journal of the American Statistical Association}.  \bold{56}, 52--64.  

Dunn, O.  J.  (1964)  Multiple comparisons using rank sums.  \emph{Technometrics}.  \bold{6}, 241--252.  

Hochberg, Y.  (1988)  A sharper Bonferroni procedure for multiple tests of significance.  \emph{Biometrika}.  \bold{75}, 800--802.  

Holm, S.  (1979)  A simple sequentially rejective multiple test procedure.  \emph{Scandinavian Journal of Statistics}.  \bold{6}, 65--70.  

Kruskal, W.  H. and Wallis, A.  (1952)  Use of ranks in one-criterion variance analysis.  \emph{Journal of the American Statistical Association}.  \bold{47}, 583--621.  

\enc{Šidák}{Sidak}, Z.  (1967)  Rectangular confidence regions for the means of multivariate normal distributions.  \emph{Journal of the American Statistical Association}.  \bold{62}, 626--633.  
}
\examples{
## Example cribbed and modified from the kruskal.test documentation
## Hollander & Wolfe (1973), 116.  
## Mucociliary efficiency from the rate of removal of dust in normal
##  subjects, subjects with obstructive airway disease, and subjects
##  with asbestosis.  
x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis
conover.test(x=list(x,y,z))

x <- c(x, y, z)
g <- factor(rep(1:3, c(5, 4, 5)),
            labels = c("Normal",
                       "COPD",
                       "Asbestosis"))
conover.test(x, g)

## Example based on home care data from Dunn (1964)
data(homecare)
attach(homecare)
conover.test(occupation, eligibility, method="hs", list=TRUE)
detach(homecare)

## Air quality data set illustrates differences in different
## multiple comparisons adjustments
attach(airquality)
conover.test(Ozone, Month, kw=FALSE, method="bonferroni")
conover.test(Ozone, Month, kw=FALSE, method="hs")
conover.test(Ozone, Month, kw=FALSE, method="bh")
detach(airquality)
}
\keyword{htest}
\keyword{nonparametric}
\keyword{stats}
